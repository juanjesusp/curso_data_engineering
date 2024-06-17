{{
  config(
    materialized='table'
  )
}}

WITH stg_sellers AS (
    SELECT DISTINCT *
    FROM {{ ref('stg_sql_server_dbo__sellers') }}
)

SELECT 
      seller_id
    , first_name
    , last_name
    , salary
    , commission
    , address_id
    , contract_start_date_at_date
    , contract_start_date_at_time_utc
    , contract_end_date_at_date
    , contract_end_date_at_time_utc
    , date_load 
FROM stg_sellers