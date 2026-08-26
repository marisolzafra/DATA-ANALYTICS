-- Entrega del módulo 4 , Curso Comisión: 
-- Alumna: Marisol Zafra

USE Ventas_Tech_DB ; 

-- Consulta 1 — Resumen ejecutivo mensual 
SELECT
    DATEPART(MONTH, fecha_Venta) AS MES_VENTA -- EXTRACT(MONTH FROM fecha_Venta) AS mes_venta
  , SUM(cantidad * precio_Unitario) AS TOTAL_FACTURADO
  , COUNT(id_Venta) AS CANTIDAD_PEDIDOS
  , AVG(cantidad * precio_Unitario) AS TICKET_PROMEDIO
FROM ventas 
GROUP BY DATEPART(MONTH, fecha_Venta); -- GROUP BY EXTRACT(MONTH FROM fecha_Venta);

-- Consulta 2 —  Ranking de productos 
SELECT TOP 5 
    id_Producto
  , SUM(cantidad) AS UNIDADES_VENDIDAS
  , SUM(cantidad * precio_Unitario) AS TOTAL_GENERADO
FROM ventas
GROUP BY id_Producto
ORDER BY total_generado DESC;

-- Consulta 3 —  Clientes recurrentes
SELECT  
    id_Cliente
    , COUNT(id_venta) as CANT_PEDIDOS
    , SUM( cantidad * precio_Unitario) as TOTAL_GASTADO
FROM ventas
GROUP BY id_cliente --, id_venta
HAVING count(*)>1; 

-- Consulta 4 —  Meses por encima/por debajo del promedio
SELECT
    DATEPART(MONTH, fecha_Venta) AS MES_VENTA -- EXTRACT(MONTH FROM fecha_Venta) AS mes_venta 
  , SUM(cantidad * precio_Unitario) AS total_facturado
  , CASE 
        WHEN SUM(cantidad * precio_Unitario) >= (
            SELECT AVG(total_mes) 
            FROM (
                SELECT SUM(cantidad * precio_Unitario) AS total_mes 
                FROM ventas 
                GROUP BY DATEPART(MONTH, fecha_Venta) --EXTRACT(MONTH FROM fecha_Venta)
            ) AS sub
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS Observación_Venta
FROM ventas 
GROUP BY DATEPART(MONTH, fecha_Venta) ; -- EXTRACT(MONTH FROM fecha_Venta) ;
 
 -- Bloque de cierre: Hallazgos concretos detectados: 

 -- 1 -> Durante el mes de Marzo hubo un total de 10 pedidos 
 -- 2 -> El producto más vendido fue el producto con id: 2 , con un total de 13 unidades vendidas
 -- 3 -> El cliente que más gastó durante el mes de Marzo fue el cliente 1 con un total gastado de $2640 y el que menos gastó es el 4 con un total de $510
 -- 4 -> Las ventas durante el mes de Marzo se encuntran por encima del total promedio facturado