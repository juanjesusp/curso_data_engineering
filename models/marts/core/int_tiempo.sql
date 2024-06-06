{{ 
  config(
    materialized='table'
  ) 
}}
WITH FECHA AS(
{{ dbt_date.get_date_dimension(start_date="1990-01-01", end_date="2023-01-01") }})

SELECT date_day
, day_of_week
, day_of_month
, day_of_year
, month_of_year
, quarter_of_year
from FECHA