{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_addresses AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'addresses') }}
),

renamed_casted AS (
    SELECT
          address_id
        , zipcode
        , country
        , address
        , state
        , coalesce(_fivetran_deleted, false) as _fivetran_deleted
        , convert_timezone('UTC',_fivetran_synced) as _fivetran_synced 
    FROM src_addresses
)

SELECT * FROM renamed_casted