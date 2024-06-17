{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_products AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'products') }}
),

renamed_casted AS (
    SELECT
         NULLIF(PRODUCT_ID, '') AS PRODUCT_ID,
         PRICE,
         NAME,
         INVENTORY,
         coalesce(_fivetran_deleted, false) as _fivetran_deleted,
         convert_timezone('UTC',_fivetran_synced) as _fivetran_synced
    FROM src_products
)

SELECT * FROM renamed_casted