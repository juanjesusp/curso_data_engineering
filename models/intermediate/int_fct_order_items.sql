{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'order_items') }}
),
renamed_casted AS (
SELECT
          A.ORDER_ID
        , B.NAME
        , A.QUANTITY
        , B.PRICE
        , A.QUANTITY * B.PRICE AS TOTAL_TEST
    FROM ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.ORDER_ITEMS A
    INNER JOIN ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.PRODUCTS B ON A.PRODUCT_ID=B.PRODUCT_ID
    GROUP BY A.ORDER_ID, B.PRICE, A.ORDER_ID, A.QUANTITY, B.INVENTORY, B.NAME
    ORDER BY A.ORDER_ID ASC
)

SELECT * FROM renamed_casted