# **📊 RetailPro - Data Analytics Project**



**📌 Descripción del Proyecto**

RetailPro es un proyecto de análisis de datos orientado al sector retail. El objetivo principal es explorar, transformar y analizar información de ventas, clientes y productos para obtener insights que apoyen la toma de decisiones comerciales.

El repositorio contiene scripts SQL que permiten:

•	Generar métricas clave como ticket promedio, ventas por producto y clientes estratégicos.

•	Construir reportes agregados por mes, producto y cliente.

•	Identificar patrones de consumo y oportunidades de optimización en la gestión comercial.

•	El repositorio además contiene un DER que especifica las tablas generadas con sus respectivos datos y relaciones indicando las claves primarias y foráneas

•	A la vez suma un documento con las preguntas de negocio y descripción del boceto del dashboard

•	Incluye un diseño del futuro dashboard a realizarse



**🛠️ Herramientas utilizadas**

•	SQL Server: motor de base de datos principal para la ejecución de consultas.

•	T-SQL: lenguaje utilizado para la creación de scripts, joins, cálculos y funciones de agregación.

•	GitHub: repositorio para versionar y documentar el proyecto.

•	Data Analytics: metodología aplicada para transformar datos en información útil para el negocio.

•	PowerBi

•	Figma para el diseño del dashboard



**⚙️ Ejecución de los Scripts SQL**

Para correr los scripts incluidos en este repositorio:

1\.	Clonar el repositorio

bash

git clone https://github.com/marisolzafra/DATA-ANALYTICS.git

cd DATA-ANALYTICS

2\.	Abrir SQL Server Management Studio (SSMS)

o	Conectarse a la base de datos donde se encuentran las tablas ventas, productos, clientes y territorios.

3\.	Ejecutar los scripts

o	Importar el archivo .sql correspondiente desde el repositorio.

o	Validar que las tablas y columnas mencionadas en los scripts existan en la base de datos.

o	Ejecutar el script presionando F5 o el botón Run.

4\.	Visualizar resultados

o	Los scripts generan tablas con métricas como:

	Ventas mensuales (total facturado, cantidad de pedidos, ticket promedio).

	Ventas por producto (unidades vendidas, total generado).

	Ventas por cliente (cantidad de pedidos, total gastado).



**📈 Ejemplo de Resultados**

•	Ticket promedio mensual: 644,40

•	Producto más rentable: id\_Producto = 1 (3600,00 en 3 unidades).

•	Cliente más valioso: id\_Cliente = 1 (2640,00 en 2 pedidos).

Estos resultados permiten al equipo comercial identificar productos estratégicos y clientes clave para diseñar campañas de fidelización y maximizar ingresos.



**🚀 Próximos pasos**

•	Incorporar visualizaciones con Power BI o Tableau.

•	Automatizar la carga de datos y ejecución de reportes.

•	Expandir el análisis hacia métricas de segmentación de clientes y predicción de ventas.



