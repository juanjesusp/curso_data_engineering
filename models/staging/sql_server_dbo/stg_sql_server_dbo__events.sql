{{ 
  config(
    materialized='view'
  ) 
}}

WITH src_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
),

renamed_casted AS (
SELECT
          A.EVENT_ID
        , A.PAGE_URL
        , A.EVENT_TYPE
        , A.USER_ID
        , COALESCE(NULLIF(TRIM(A.PRODUCT_ID), ''), 'DESCONOCIDO') as PRODUCT_ID
        , A.SESSION_ID
        , A.CREATED_AT
        , COALESCE(NULLIF(TRIM(A.ORDER_ID), ''), 'DESCONOCIDO') as ORDER_ID
        , coalesce(A._fivetran_deleted, false) as _fivetran_deleted
        , convert_timezone('UTC',A._fivetran_synced) as _fivetran_synced
       -- , A.ORDER_ID
    FROM ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.events A
    INNER JOIN ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.USERS B ON A.USER_ID=B.USER_ID
    INNER JOIN ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.PRODUCTS C ON A.PRODUCT_ID=C.PRODUCT_ID
    LEFT JOIN ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.ORDER_ITEMS D ON A.ORDER_ID=D.ORDER_ID
)

SELECT * FROM renamed_casted