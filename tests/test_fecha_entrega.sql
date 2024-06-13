SELECT *
FROM {{ ref('stg_sql_server_dbo__orders') }}
WHERE DELIVERED_AT < CREATED_AT