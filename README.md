# curso_data_engineering

https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#estructura-del-proyecto



## **Estructura del proyecto**

Tiene 2 data sources, que son Google Sheets y SQL server. A parte, el proyecto está formado por 3 etapas las cuales son las siguientes:


- Bronze. Son los datos crudos tal cual, vienen sin tratar.

- Silver. Aquí se producen transformaciones y casteos. Podemos ver un ejemplo del proyecto de la capa silver en el siguiente enlace:

- https://github.com/juanjesusp/curso_data_engineering/tree/rama_init/models/staging

- Gold. En esta última capa, contiene tablas de dimensiones y tablas de hechos. Podemos ver un ejemplo del proyecto de la capa Gold en el siguiente enlace: 

- https://github.com/juanjesusp/curso_data_engineering/tree/rama_init/models/marts/core

---

## **Testing**

Los datos nunca están limpios al 100%. Siempre habrá matices que considerar, lógica de negocio que aplicar y datos que limpiar antes de que estén listos para ser consumidos y analizados. 

Proactivamente probar sus datos le permite tener más facilidad de que los datos que están pasando a l@s usuari@s son exactos.

Además, una vez hemos establecido tests en nuestro proyecto, cuando continuemos realizando desarrollos estos nos permitirán validar que todo sigue siendo correcto y no hemos realizado un cambio que afecte a otros desarrollos.

Los tests son pruebas para validar que los datos de nuestros modelos y sources son correctos.

---

## **Snapshots**

Los snapshots son una herramienta que nos permite en dbt ver el estado anterior de los datos sobre tablas mutables, ya que en ocasiones en algunos DW no es posible. Es decir, registra los cambios de una tabla mutable en el tiempo.

---

## **Para este proyecto, se han utilizado las siguientes herramientas:**

### **DBT(DATA BUILD TOOL)**

<img width="90" alt="dbt-bit_tm" src="https://github.com/juanjesusp/curso_data_engineering/assets/170645486/c662e11c-30fa-4dae-b552-477d5bb3762a">



DBT permite a los ingenieros de datos y analistas realizar transformaciones en los datos escribiendo sentencias SQL de tipo SELECT. Internamente, DBT traduce estas sentencias en tablas y en vistas. De esta forma facilita la creación de transformaciones sobre los datos disponibles en el data warehouse.

Para funcionar, necesita Python 3.7 o superior. Es posible instalarlo fácilmente con pip e incluye dos componentes open source: una CLI o interfaz de línea de comandos y la interfaz gráfica de usuario.

DBT CLI ofrece la capacidad de interactuar con la herramienta para ejecutar los modelos, ejecutar tests o generar documentación. La interfaz de usuario (UI) se usa para visualizar la documentación y el linaje, pero no permite editar las configuraciones ni realizar cambios en el sistema.

---


### **SnowFlake**

![Snowflake_Logo svg](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/85aec1d9-4443-4fd6-b56a-2921c2c378d3)


Snowflake es una plataforma de almacenamiento y análisis de datos en la nube altamente diseñada para ayudar a empresas y organizaciones a almacenar, procesar y analizar grandes cantidades de datos de manera eficiente y segura. Snowflake se destaca por su arquitectura única y su capacidad para manejar datos estructurados y semiestructurados, siendo un entorno escalable y totalmente administrado. 

---
