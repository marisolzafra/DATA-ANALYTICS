-- Entrega del módulo 3 , Curso Comisión: 
-- Alumna: Marisol Zafra

-- Paso 1: Creación de la base de datos
--CREATE DATABASE Ventas_Tech_DB;


-- Paso 2: Desarrollo del Script

-- A: Eliminación si ya existen las tablas
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- B: Creación de las tablas
use Ventas_Tech_DB;

-- Tabla: Categorias 
CREATE TABLE Categorias (
	id_Categoria INT primary key,
	nombre_Categoria VARCHAR(50) not null,
	descripcion VARCHAR(200)
);

-- Tabla Clientes:
CREATE TABLE Clientes (
	id_Cliente INT primary key,
	nombre VARCHAR(100) not null,
	email VARCHAR(100) unique,
	ciudad VARCHAR(50) ,
	fecha_Registro date not null
); 

-- Tabla Productos:
CREATE TABLE Productos (
	id_Producto INT primary key,
	nombre_Producto VARCHAR(100) not null,
	id_Categoria INT ,
	precio DECIMAL(10,2) not null,
	stock INT DEFAULT 0,
	activo BIT DEFAULT 1,
-- Definición de la Constraint FK de Productos:
    CONSTRAINT fk_Productos
    FOREIGN KEY (id_Categoria) 
    REFERENCES Categorias(id_Categoria)
) ;

-- Tabla Ventas: 
CREATE TABLE Ventas (
	id_Venta INT primary key,
	id_Cliente INT ,
	id_Producto INT , 
	cantidad INT not null,
	precio_Unitario DECIMAL(10,2) not null,
	fecha_Venta date not null , 
-- Definición de las FK de Productos:
    CONSTRAINT fk_Clientes_Ventas
    FOREIGN KEY (id_Cliente) 
    REFERENCES Clientes(id_Cliente), 
	
	CONSTRAINT fk_Productos_Ventas
    FOREIGN KEY (id_Producto) 
    REFERENCES Productos(id_Producto)
); 


-- Paso 3: Insertar datos en las distintas tablas creadas

-- Categorias (4 registros)
INSERT INTO categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

-- Clientes (5)
INSERT INTO clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

-- Productos (6)
INSERT INTO productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

-- Ventas (10)
INSERT INTO ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

-- Paso 4: Verificar la integridad
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
