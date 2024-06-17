{{
  config(
    materialized='table'
  )
}}

WITH stg_sql_server_dbo__products AS (
    SELECT *
    FROM {{ ref('stg_sql_server_dbo__products') }}
)

SELECT 
       product_id
    ,  inventory
FROM stg_sql_server_dbo__products