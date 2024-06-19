{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_order_items AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'order_items') }}
),

renamed_casted AS (
    SELECT
          B.PRICE
        , B.INVENTORY
        , B.NAME
        , A.ORDER_ID
        , A.PRODUCT_ID
        , A.QUANTITY
        , A.ID_SELLER
        , coalesce(A._fivetran_deleted, false) as _fivetran_deleted
        , convert_timezone('UTC',A._fivetran_synced) as _fivetran_synced
    FROM ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.ORDER_ITEMS A
    INNER JOIN ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.PRODUCTS B ON A.PRODUCT_ID=B.PRODUCT_ID
)

SELECT * FROM renamed_casted 