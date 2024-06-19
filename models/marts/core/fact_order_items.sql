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


SELECT PRICE, INVENTORY, NAME, ORDER_ID, PRODUCT_ID, QUANTITY, ID_SELLER
FROM stg_sql_server_dbo__order_items

