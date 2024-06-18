WITH events AS (
    SELECT * 
    FROM {{ref('fact_events')}}
),

events_sum AS (
    SELECT *
    FROM {{ref('int_suma_eventos')}}

),

users AS (
    SELECT * 
    FROM {{ref('dim_users')}}
),

joined AS (
    SELECT
        a.session_id,
        a.user_id,
        u.first_name,
        u.email,
        MIN(a.created_at) AS begin_session,
        MAX(a.created_at) AS end_session,
        COUNT(a.page_url) AS pages_views,
        DATEDIFF(minute, MIN(a.created_at), MAX(a.created_at)) AS session_minutes,
        b.checkout_amount,
        b.package_shipped_amount,
        b.add_to_cart_amount,
        b.page_view_amount
    FROM users u
    JOIN events a
    ON u.user_id = a.user_id
    JOIN events_sum b
    ON u.user_id = b.user_id
    GROUP BY ALL
)

SELECT * FROM joined