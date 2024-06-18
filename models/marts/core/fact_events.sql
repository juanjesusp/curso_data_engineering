WITH events AS (
    SELECT *
    FROM {{ ref('stg_sql_server_dbo__events') }}
),

final AS (
    SELECT
        event_id,
        page_url,
        event_type,
        user_id,
        product_id,
        session_id,
        created_at,
        order_id
    FROM events
)

SELECT * FROM final