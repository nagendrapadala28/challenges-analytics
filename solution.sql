Part 1: 
INSERT INTO fct_client_conversion_events (user_id, client_conversion_type, client_conversion_id, client_conversion_date)
SELECT DISTINCT ON (user_id) 
    user_id, 
    purchase_type, 
    purchase_id, 
    purchase_date
FROM (
    SELECT 
        user_id,
        'membership' AS purchase_type,
        membership_id AS purchase_id,
        purchase_date
    FROM membership_purchases
    WHERE purchase_date IS NOT NULL

    UNION ALL

    SELECT 
        user_id,
        'credit_pack' AS purchase_type,
        credit_pack_id AS purchase_id,
        purchase_date
    FROM credit_pack_purchases
    WHERE purchase_date IS NOT NULL

) AS purchases
ORDER BY user_id, purchase_date, purchase_type DESC;


Part 2: 
WITH purchases AS (
    SELECT 
        user_id,
        'membership' AS purchase_type,
        membership_id AS purchase_id,
        purchase_date
    FROM membership_purchases
    WHERE purchase_date IS NOT NULL
    UNION ALL
    SELECT 
        user_id,
        'credit_pack' AS purchase_type,
        credit_pack_id AS purchase_id,
        purchase_date
    FROM credit_pack_purchases
    WHERE purchase_date IS NOT NULL
),
ranked_purchases AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY user_id, purchase_type ORDER BY purchase_date) AS rn
    FROM purchases
)
INSERT INTO fct_client_conversion_events (user_id, client_conversion_type, client_conversion_id, client_conversion_date, client_conversion_event_filter)
SELECT user_id, purchase_type, purchase_id, purchase_date, 'MEMBERSHIP'
FROM ranked_purchases
WHERE purchase_type = 'membership' AND rn = 1
UNION ALL
SELECT user_id, purchase_type, purchase_id, purchase_date, 'USER_CREDIT'
FROM ranked_purchases
WHERE purchase_type = 'credit_pack' AND rn = 1
UNION ALL
SELECT user_id, purchase_type, purchase_id, purchase_date, 'ALL'
FROM ranked_purchases
WHERE rn = 1;