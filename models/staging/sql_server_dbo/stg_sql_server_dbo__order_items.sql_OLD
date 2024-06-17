{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_order_items AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'order_items') }}
),

renamed_casted AS (
    SELECT
          ORDER_ID
        , PRODUCT_ID
        , QUANTITY
        , coalesce(_fivetran_deleted, false) as _fivetran_deleted
        , convert_timezone('UTC',_fivetran_synced) as _fivetran_synced
    FROM src_order_items
)

SELECT * FROM renamed_casted