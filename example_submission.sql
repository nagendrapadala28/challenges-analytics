WITH ordered_memberships AS (
	SELECT
	    *
	    , ROW_NUMBER() OVER (
	        PARTITION BY
	            fmp.branch_id
	    		, fmp.user_id
			ORDER BY membership_purchased_at DESC
	    ) AS row_order_membership_purchases
	FROM
	    fct_membership_purchases AS fmp
)

, first_membership_purchases AS (
	SELECT
	    *
	FROM
	    ordered_memberships
	WHERE
	    row_order_membership_purchases = 1
)

, ordered_credit_packs AS (
	SELECT
	    *
	    , ROW_NUMBER() OVER (
	        PARTITION BY
	            fmp.branch_id
	    		, fmp.user_id
			ORDER BY credit_pack_purchased_at DESC
	    ) AS row_order_credit_pack_purchases
	FROM
	    public.fct_credit_pack_purchases AS fmp
)

, first_credit_purchases AS (
	SELECT
	    *
	FROM
	    ordered_credit_packs
	WHERE
	    row_order_credit_pack_purchases = 1
)

, user_and_branch_details AS (
	SELECT
	    *
	FROM
	    dim_user AS du
	INNER JOIN dim_branch AS db ON
	    du.branch_id = db.branch_id
)

INSERT INTO fct_client_conversion_events
SELECT
    du.user_id
    , du.branch_id
    , du.created_at AT TIME ZONE COALESCE(db.timezone_id, 'utc')                                                                                                             AS local_user_created_at
    , CASE
        WHEN fmp.membership_id NOTNULL
        OR fcp.credit_pack_id NOTNULL THEN 'CLIENT'
        ELSE 'LEAD'
    END                                                                                                                                                                                         AS lead_status
    , CASE
        WHEN (fmp.membership_purchased_at >= fcp.credit_pack_purchased_at) OR (fmp.membership_id NOTNULL AND fcp.credit_pack_id IS NULL) THEN 'MEMBERSHIP'
        WHEN (fcp.credit_pack_purchased_at >= fmp.membership_purchased_at) OR (fcp.credit_pack_id NOTNULL AND fmp.membership_id IS NULL) THEN 'CREDIT_PACK'
    END                                                                                                                                                                                         AS client_conversion_event_type
    , CASE
        WHEN (fmp.membership_purchased_at >= fcp.credit_pack_purchased_at) OR (fmp.membership_id NOTNULL AND fcp.credit_pack_id IS NULL) THEN fmp.membership_id
        WHEN (fcp.credit_pack_purchased_at >= fmp.membership_purchased_at) OR (fcp.credit_pack_id NOTNULL AND fmp.membership_id IS NULL) THEN fcp.credit_pack_id
    END                                                                                                                                                                                         AS client_conversion_event_id
    , (
        CASE
            WHEN (fmp.membership_purchased_at >= fcp.credit_pack_purchased_at) OR (fmp.membership_id NOTNULL AND fcp.credit_pack_id IS NULL) THEN fmp.membership_purchased_at
            WHEN (fcp.credit_pack_purchased_at >= fmp.membership_purchased_at) OR (fcp.credit_pack_id NOTNULL AND fmp.membership_id IS NULL) THEN fcp.credit_pack_purchased_at
        END
    ) AT TIME ZONE 'utc' AT TIME ZONE db.timezone_id                                                                                                                                            AS client_conversion_event_local_created_at
    , TRIM('"' FROM (
        CASE
            WHEN (fmp.membership_purchased_at >= fcp.credit_pack_purchased_at) OR (fmp.membership_id NOTNULL AND fcp.credit_pack_id IS NULL) THEN fmp.membership_purchase_details -> 'name'
            WHEN (fcp.credit_pack_purchased_at >= fmp.membership_purchased_at) OR (fcp.credit_pack_id NOTNULL AND fmp.membership_id IS NULL) THEN fcp.credit_pack_purchase_details -> 'name'
        END)::TEXT
    )                                                                                                                                                                                           AS client_conversion_event_name
    , TRIM('"' FROM (
    CASE
        WHEN (fmp.membership_purchased_at >= fcp.credit_pack_purchased_at) OR
             (fmp.membership_id NOTNULL AND fcp.credit_pack_id IS NULL) THEN fmp.membership_purchase_details -> 'source'
        WHEN (fcp.credit_pack_purchased_at >= fmp.membership_purchased_at) OR
             (fcp.credit_pack_id NOTNULL AND fmp.membership_id IS NULL)
            THEN fcp.credit_pack_purchase_details -> 'source'
        END)::TEXT
    )                                                                                                                                                                                           AS client_conversion_event_source
    , fmp.membership_id                                                                                                                                                                         AS first_user_membership_id
    , fmp.membership_purchased_at AT TIME ZONE COALESCE(db.timezone_id, 'utc')                                                                                                                AS first_local_membership_purchased_at
    , TRIM('"' FROM (fmp.membership_purchase_details -> 'name')::TEXT)                                                                                                                            AS first_membership_name
    , TRIM('"' FROM (fmp.membership_purchase_details -> 'source')::TEXT)                                                                                                                          AS first_membership_source
    , fcp.credit_pack_id                                                                                                                                                                        AS first_credit_pack_id
    , fcp.credit_pack_purchased_at AT TIME ZONE COALESCE(db.timezone_id, 'utc')                                                                                                               AS first_local_credit_pack_purchase_at
    , TRIM('"' FROM (fcp.credit_pack_purchase_details -> 'name')::TEXT)                                                                                                                           AS first_credit_pack_name
    , TRIM('"' FROM (fcp.credit_pack_purchase_details -> 'source')::TEXT)                                                                                                                         AS first_credit_pack_source
FROM
    dim_user AS du
INNER JOIN dim_branch AS db ON
    du.branch_id = db.branch_id
LEFT JOIN first_membership_purchases AS fmp ON
    du.user_id = fmp.user_id
LEFT JOIN first_credit_purchases AS fcp ON
    du.user_id = fcp.user_id;