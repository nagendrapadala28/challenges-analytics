CREATE TABLE public.test_table
(
    id   int,
    name varchar(255)
);

COPY public.test_table FROM '/var/lib/postgresql/seed/test_table.csv' DELIMITER '|' CSV HEADER;