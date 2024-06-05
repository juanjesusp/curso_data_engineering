{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_promos AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'promos') }}
),

renamed_casted AS (
    SELECT
          PROMO_ID, 
          md5(COALESCE(NULLIF(TRIM(PROMO_ID), ''), 'DESCONOCIDO')) AS surrogate_key, 
          DISCOUNT AS DISCOUNT_EUROS, 
          STATUS, 
          coalesce(_fivetran_deleted, false) as _fivetran_deleted, 
          convert_timezone('UTC',_fivetran_synced) as _fivetran_synced
    FROM src_promos
)

SELECT * FROM renamed_casted