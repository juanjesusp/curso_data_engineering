{{ config(
  materialized='table'
) }}

WITH stg_sql_server_dbo_status AS 
(
    SELECT DISTINCT(status)
    FROM {{ ref('stg_sql_server_dbo__orders') }}
)

SELECT       
    {{ dbt_utils.generate_surrogate_key(['status']) }} AS  id_status
    , status
FROM stg_sql_server_dbo_status