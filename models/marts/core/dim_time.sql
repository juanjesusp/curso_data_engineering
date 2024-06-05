-- models/core/dim_time.sql

{{ config(
    schema='core',
    materialized='table',
    unique_key='date'
) }}

with date_range as (
    select
        dbt_date_sequence(
            start_date => '2020-01-01',
            end_date => '2030-12-31',
            interval => '1 day'
        ) as date
)

select
    date,
    extract(year from date) as year,
    extract(month from date) as month,
    extract(day from date) as day,
    extract(quarter from date) as quarter,
    extract(week from date) as week,
    extract(dow from date) as day_of_week,
    to_char(date, 'Day') as day_name,
    to_char(date, 'Month') as month_name,
    dbt_date_is_weekend(date) as is_weekend
from
    date_range
