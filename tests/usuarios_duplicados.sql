SELECT user_id, count(*)
FROM ALUMNO21DEVBRONZEDB.SQL_SERVER_DBO.USERS
GROUP BY 1
HAVING count(*) > 1