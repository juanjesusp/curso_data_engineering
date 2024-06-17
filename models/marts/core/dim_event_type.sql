{{
  config(
    materialized='table'
  )
}}

WITH stg_event_types_id AS (
    SELECT DISTINCT event_id,event_type
    FROM {{ ref('stg_sql_server_dbo__events') }}
)

SELECT event_id,
        event_type
FROM stg_event_types_id