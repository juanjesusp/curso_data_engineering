{{ 
  config(
    materialized='view'
  ) 
}}

    SELECT
       0 as id_status,
       'Active' as status_name
    UNION ALL
    SELECT 
       1 as id_status,
       'Inactive' as status_name
