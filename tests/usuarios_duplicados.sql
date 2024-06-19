SELECT user_id, count(*)
FROM {{ ref('stg_sql_server_dbo__users') }}
GROUP BY 1
HAVING count(*) > 1