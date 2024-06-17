{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
),

renamed_casted AS (
SELECT
     B.SHIPPING_COST AS SHIPPING_COST_EUROS, B.USER_ID, B.ORDER_TOTAL,
          NULLIF(B.SHIPPING_SERVICE, '') AS SHIPPING_SERVICE,
          --A.PROMO_ID,
          B.status,
          B.CREATED_AT,
          B.DELIVERED_AT,
          --md5(A.promo_id) as surrogate_key,
          {{ dbt_utils.generate_surrogate_key(['A.promo_id']) }} AS promo_id_key, 
          COALESCE(NULLIF(TRIM(A.PROMO_ID), ''), 'DESCONOCIDO') AS PROMO_ID, 
          A.DISCOUNT AS DISCOUNT_EUROS,
        (B.ORDER_COST + B.SHIPPING_COST) - (A.DISCOUNT) AS ORDER_TOTAL_2
        --A.DISCOUNT AS ORDER_TOTAL_2
    FROM ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.PROMOS A
    LEFT JOIN ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.ORDERS B ON A.PROMO_ID=B.PROMO_ID
    GROUP BY A.PROMO_ID, A.discount, B.SHIPPING_COST, B.SHIPPING_SERVICE, B.USER_ID, B.ORDER_COST, B.SHIPPING_COST, A.DISCOUNT, B.ORDER_TOTAL, B.CREATED_AT, B.DELIVERED_AT, B.status
    ORDER BY USER_ID ASC
)

SELECT * FROM renamed_casted