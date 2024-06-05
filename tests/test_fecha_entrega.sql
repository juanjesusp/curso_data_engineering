SELECT *
FROM {{ ref('stg_sql_server_dbo__orders') }}
WHERE delivery_date < order_placed_date