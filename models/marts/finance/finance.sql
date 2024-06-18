WITH fct_budget AS (
    SELECT 
        month_of_year,
        product_id,
        sum(quantity) as budget_quantity
    FROM {{ref('fact_budget')}} b
    JOIN {{ref('int_tiempo')}} t
    ON b.month = t.date
    GROUP BY 1,2
),

fct_orders_products AS (
    SELECT
        month_of_year,
        product_id,
        sum(product_quantity) AS sales_quantity
    FROM {{ref('fact_order_items')}} o 
    JOIN {{ref('int_tiempo')}} t
    ON o.created_at_utc = t.date
    GROUP BY 1,2
),

joined AS (
    SELECT
        month_of_year,
        b.product_id, 
        budget_quantity,
        sales_quantity,
        sales_quantity - budget_quantity AS prevision_difference
    FROM fct_budget b 
    LEFT JOIN fct_orders_products op ON b.product_id = op.product_id AND b.year_month = op.year_month
)
SELECT * FROM joined ORDER BY 1,2