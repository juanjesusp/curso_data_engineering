{{
  config(
    materialized='table',
  )
}}

WITH stg_sql_server_dbo__orders AS
(
    SELECT *
    FROM {{ref("stg_sql_server_dbo__orders")}}
)


SELECT *
FROM stg_sql_server_dbo__orders