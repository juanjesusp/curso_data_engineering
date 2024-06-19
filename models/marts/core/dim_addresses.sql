{{
  config(
    materialized='table'
  )
}}

WITH stg_sql_server_dbo__addresses AS (
    SELECT *
    FROM {{ ref('stg_sql_server_dbo__addresses') }}
)

SELECT *
FROM stg_sql_server_dbo__addresses