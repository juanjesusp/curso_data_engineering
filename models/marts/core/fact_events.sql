{{
  config(
    materialized='table'
  )
}}

WITH stg_sql_server_dbo__events AS 
(
    SELECT *
    FROM {{ ref("stg_sql_server_dbo__events") }}
)

SELECT
    event_id
    , page_url
    , user_id
    , session_id
    , order_id
    , product_id
FROM stg_sql_server_dbo__events