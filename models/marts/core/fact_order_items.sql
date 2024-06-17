{{
  config(
    materialized='table',
  )
}}

WITH stg_sql_server_dbo__order_items AS
(
    SELECT *
    FROM {{ref("stg_sql_server_dbo__order_items")}}
)


SELECT *
FROM stg_sql_server_dbo__order_items

