# Curso Data Engineering

## **INDICE**

[Introducción](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#introducci%C3%B3n)

[Estructura del proyecto](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#estructura-del-proyecto)

[Testing](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#testing)

[Snapshots](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#snapshots)

[Macros](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#macros)

[Linaje](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#linaje)

[Prueba con dbt run](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#dbt-run)

[Prueba con dbt build](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#dbt-build)

[Herramientas utilizadas](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#para-este-proyecto-se-han-utilizado-las-siguientes-herramientas)

[Usar el proyecto](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#usar-el-proyecto)

[Recursos](https://github.com/juanjesusp/curso_data_engineering/blob/rama_init/README.md#recursos)

---

## **Introducción**

Este proyecto está basado sobre lo que hemos hecho en clase. Es un proyecto pequeño, por lo cual tiene datos limitados. A continuación veremos el proyecto junto con las herramientas utilizadas.

---

## **Esquema E-R**

![Source](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/18573966-513f-40b6-ae02-92d263753e74)

---

## **Estructura del proyecto**

El proyecto tiene 2 data sources, que son Google Sheets y SQL server. 


A parte, el proyecto está formado por 3 etapas las cuales son las siguientes:


- Bronze. Son los datos crudos tal cual, vienen sin tratar.

- Silver. Aquí es donde se producen transformaciones y casteos. Aquí podemos ver cómo es la capa Staging.

![Capa_silver](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/5da2f7d5-414c-44b0-8968-6b2229999fb7)


- Podemos ver un ejemplo del proyecto de la capa silver en el siguiente enlace:

- https://github.com/juanjesusp/curso_data_engineering/tree/rama_init/models/staging

- Gold. En esta última capa, contiene tablas de dimensiones y tablas de hechos.
  
![Capa_gold](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/5525741f-6437-46fc-9e68-d559332329e2)

- Podemos ver un ejemplo del proyecto de la capa Gold en el siguiente enlace:

- https://github.com/juanjesusp/curso_data_engineering/tree/rama_init/models/marts/core


---

## **Testing**

Los datos nunca están limpios al 100%. Por eso hay que hacer tests. Para ello, hay que definirlos en el yaml, ya que se declaran en el linaje.

Siempre habrá matices que considerar, lógica de negocio que aplicar y datos que limpiar antes de que estén listos para ser consumidos y analizados. 

Además, una vez hemos establecido tests en nuestro proyecto, cuando continuemos realizando desarrollos estos nos permitirán validar que todo sigue siendo correcto y no hemos realizado un cambio que afecte a otros desarrollos.


Los tests son pruebas para validar que los datos de nuestros modelos y sources son correctos. A continuación, se muestra una captura de un test genérico:

![test_positive_values](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/586769f4-ea83-4c11-8223-91db463a3efd)

![yml-tests](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/bcfcb170-bf70-4fd1-bc54-4fcb872674e4)

![yml-tests-2](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/7409b0f4-9796-4839-98e1-6f8f11994021)

---

## **Snapshots**

Los snapshots son una herramienta que nos permite hacer en dbt copias instantáneas de los datos y la metadata en un punto específico en el tiempo. Se puede utilizar para recuperar la metadata o los datos. Los Snapshots se definen en el directorio de Snapshots. En la siguiente captura, podemos ver esto:


![snapshot budget](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/162f0dc1-dc56-49b9-82f7-5fe108c68082)


---

## **Macros**

Las macros son trozos de código (SQL + jinja) que pueden ser reutilizados tantas veces sea necesario. 

Son similares a las funciones en cualquier lenguaje de programación. Útiles cuando se repite mucho código en las consultas SQL.


---

## **Linaje**

![Linaje](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/56bc1a28-03be-4fc0-ae71-8d005559517e)


---

## **dbt run**

![dbt_run_ok](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/6041cae9-6dc3-4f11-9fc8-8b6dbf839959)

---

## **dbt build**

![dbt_build_ok](https://github.com/juanjesusp/curso_data_engineering/assets/170645486/db951d28-184e-4244-881a-4b6e71633a3b)


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


## **Usar el proyecto**

Ejecutar los siguientes comandos:

- dbt run

- dbt build

- dbt test

---

## **Recursos**

- Aprender más sobre dbt en la [documentación](https://docs.getdbt.com/docs/introduction)
- Visitar el [foro](https://discourse.getdbt.com/) para las preguntas más comunes y sus respuestas.
- Unirse a la [comunidad](http://community.getbdt.com/) de dbt para aprender de otros analistas e ingenieros.
- Encuentra [eventos de dbt](https://events.getdbt.com/) cerca de ti.
- Revisar [el blog](https://blog.getdbt.com/) para las últimas novedades sobre el desarrollo y las mejores prácticas de dbt.
