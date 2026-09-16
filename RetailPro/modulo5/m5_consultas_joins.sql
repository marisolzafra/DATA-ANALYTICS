-- Entrega del módulo 5 , Curso Comisión: 
-- Alumna: Marisol Zafra

-- Genero la tabla de Territorios porque no existe y no habia solicitada en ejercicios anteriores
DROP TABLE IF EXISTS Territorios;

-- Tabla: Territorios 
CREATE TABLE Territorios (
	id_Territorio INT primary key,
	nombre_Territorio VARCHAR(50) not null,
	segmento VARCHAR(50),
	region varchar(50) not null
);

ALTER TABLE ventas ADD id_Territorio int; 
ALTER TABLE ventas ADD Canal varchar(20); 


-- Ingreso clientes nuevos sin ventas para la consulta 2
INSERT INTO clientes VALUES (6, 'Brisa del mar',   'bridelmar@mail.com',   'Buenos Aires', '2026-01-05');
INSERT INTO clientes VALUES (7, 'Brumita Love',   'brumilove@mail.com',  'Córdoba',      '2025-01-10');
INSERT INTO clientes VALUES (8, 'Jack Rupper',     'jrupper@mail.com',     'Rosario',      '2026-02-01');


-- Ingreso productos nuevos sin ventas para la consulta 3
INSERT INTO productos VALUES (7, 'Teclado',       2, 1000.00, 25, 1);
INSERT INTO productos VALUES (8, 'Mouse Pad',   2,   10.00, 10, 1);
INSERT INTO productos VALUES (9, 'Monitor 24"',      1,  250.00, 7, 1);
INSERT INTO productos VALUES (10, 'Auriculares Gammer',  3,  150.00, 5, 1);


-- Consulta 1 — Vista base del proyecto (INNER JOIN) 
SELECT 
		v.fecha_Venta 
	,	c.nombre as Nombre_Cliente
	,	ISNULL(t.segmento ,'') AS segmento
	,	ISNULL(t.region ,'') AS  region
	,	p.nombre_Producto
	,	p.id_Categoria 
	,	v.cantidad 
	,	v.precio_Unitario 
	,	cantidad * precio_unitario as Total_Venta
	,   Canal
FROM ventas as V
INNER JOIN productos as p on p.id_Producto = v.id_Producto
INNER JOIN clientes as c on c.id_Cliente = v.id_Cliente 
LEFT JOIN Territorios as t on t.id_Territorio = v.id_territorio 
 

-- Consulta 2 —  Clientes sin ventas (LEFT JOIN) 
SELECT 
			c.nombre as Nombre_Cliente
		,	c.email 
		,	fecha_Registro 
FROM clientes as c 
left join VENTAS as v on c.id_Cliente = v.id_Cliente 
where id_venta is null

-- Consulta 3 — Productos sin ventas (LEFT JOIN) 
select 
		p.nombre_Producto 
	,	p.id_Categoria 
	,	p.precio
FROM Productos as p
left join VENTAS as v on p.id_Producto = v.id_Producto
where v.id_Producto is null

-- Consulta 4 — Consolidado por canal (UNION ALL) 
SELECT 
		CANAL 
	,	TOTAL_Ventas = SUM(ID_VENTA)
FROM VENTAS
WHERE CANAL = 'PRESENCIAL'
 GROUP BY CANAL 
UNION ALL
SELECT 
		CANAL 
	,	TOTAL_Ventas = SUM(ID_VENTA)
FROM VENTAS
WHERE CANAL = 'ONLINE'
GROUP BY CANAL ;

