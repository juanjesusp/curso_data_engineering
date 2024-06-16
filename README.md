# curso_data_engineering

Para este proyecto, se han utilizado las siguientes herramientas:

DBT(DATA BUILD TOOL)

DBT permite a los ingenieros de datos y analistas realizar transformaciones en los datos escribiendo sentencias SQL de tipo SELECT. Internamente, DBT traduce estas sentencias en tablas y en vistas. De esta forma facilita la creación de transformaciones sobre los datos disponibles en el data warehouse.

Para funcionar, necesita Python 3.7 o superior. Es posible instalarlo fácilmente con pip e incluye dos componentes open source: una CLI o interfaz de línea de comandos y la interfaz gráfica de usuario.

DBT CLI ofrece la capacidad de interactuar con la herramienta para ejecutar los modelos, ejecutar tests o generar documentación. La interfaz de usuario (UI) se usa para visualizar la documentación y el linaje, pero no permite editar las configuraciones ni realizar cambios en el sistema.

Imagen....

SnowFlake

Snowflake es una plataforma de almacenamiento y análisis de datos en la nube altamente diseñada para ayudar a empresas y organizaciones a almacenar, procesar y analizar grandes cantidades de datos de manera eficiente y segura. Snowflake se destaca por su arquitectura única y su capacidad para manejar datos estructurados y semiestructurados, siendo un entorno escalable y totalmente administrado. 


Estructura del proyecto

Tiene 2 data sources, que son Google Sheets y SQL server. A parte, el proyecto está formado por 3 etapas las cuales son las siguientes:


- Bronze. Son los datos crudos tal cual, vienen sin tratar.

- Silver. Aquí se producen transformaciones y casteos.

- Gold. En esta última capa, contiene tablas de dimensiones y tablas de hechos.

Ahora vamos a explicar con un poco más de detalle el proceso de las etepas de Bronze, Silver y Gold.


Bronze. Como hemos dicho anteriormente, son los datos tal cual vienen de los sources, y son los datos tal cual vienen, sin ningún tipo de cambio.

Silver. Explicación....


