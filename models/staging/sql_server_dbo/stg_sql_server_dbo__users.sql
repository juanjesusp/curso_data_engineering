{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
),

renamed_casted AS (
    SELECT
          USER_ID
        , UPDATED_AT
        , ADDRESS_ID
        , LAST_NAME
        , CREATED_AT
        , PHONE_NUMBER
        , coalesce(TOTAL_ORDERS, 0) as TOTAL_ORDERS
        , FIRST_NAME
        , EMAIL
        , coalesce (regexp_like(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')= true,false) as is_valid_email_address
        , coalesce(_fivetran_deleted, false) as _fivetran_deleted
        , convert_timezone('UTC',_fivetran_synced) as _fivetran_synced
    FROM src_users
)

SELECT * FROM renamed_casted