{{
  config(
    materialized='table'
  )
}}

WITH stg_sql_server_dbo__users AS 
(
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__users') }}
)

    select     
    {{ dbt_utils.generate_surrogate_key(['user_id']) }} AS user_id_key
    , first_name
    , last_name
    , address_id
    , email
    , phone_number
    from stg_sql_server_dbo__users