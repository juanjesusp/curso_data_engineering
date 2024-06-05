{{ 
  config(
    materialized='table'
  ) 
}}
WITH FECHA AS(
{{ dbt_date.get_date_dimension(start_date="1990-01-01", end_date="2023-01-01") }})

SELECT date_day FROM FECHA