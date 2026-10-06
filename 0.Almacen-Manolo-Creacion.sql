-- ======================================================
-- CREACIÓN DE BASE DE DATOS: AlmacenManolo
-- AYUDANTIA SANTO TOMAS - BASE DE DATOS - Bruno O.
-- ======================================================
DROP DATABASE IF EXISTS AlmacenManolo;
CREATE DATABASE AlmacenManolo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE AlmacenManolo;

-- ======================================================
-- 1. TABLA: clientes
-- ======================================================
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefono VARCHAR(20),
    ciudad VARCHAR(60) DEFAULT 'Santiago',
    fecha_registro DATE NOT NULL,
    activo TINYINT(1) DEFAULT 1
) ENGINE=InnoDB;

-- ======================================================
-- 2. TABLA: productos
-- ======================================================
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('Abarrotes', 'Lácteos', 'Bebidas', 'Panadería', 'Limpieza', 'Fiambres') NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    proveedor VARCHAR(100)
) ENGINE=InnoDB;

-- ======================================================
-- 3. TABLA: vendedores
-- ======================================================
CREATE TABLE vendedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    sueldo DECIMAL(10,2) NOT NULL,
    fecha_contratacion DATE NOT NULL
) ENGINE=InnoDB;

-- ======================================================
-- 4. TABLA: ventas (Boletas)
-- ======================================================
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    metodo_pago ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    observacion VARCHAR(255),
    CONSTRAINT fk_ventas_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_ventas_vendedor FOREIGN KEY (vendedor_id) REFERENCES vendedores(id)
) ENGINE=InnoDB;

-- ======================================================
-- 5. TABLA: detalle_ventas
-- ======================================================
CREATE TABLE detalle_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_detalle_venta FOREIGN KEY (venta_id) REFERENCES ventas(id),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (producto_id) REFERENCES productos(id)
) ENGINE=InnoDB;

-- ======================================================
-- POBLAMIENTO DE DATOS DE PRUEBA
-- ======================================================

-- CLIENTES (10)
INSERT INTO clientes (rut, nombre, apellido, email, telefono, ciudad, fecha_registro, activo) VALUES
('15.111.111-1', 'Carlos', 'Mendoza', 'carlos.mendoza@email.com', '+56 9 1111 2222', 'Santiago', '2023-01-15', 1),
('16.222.222-2', 'María', 'González', 'maria.gonzalez@email.com', NULL, 'Providencia', '2023-03-20', 1),
('17.333.333-3', 'Juan', 'Pérez', NULL, '+56 9 3333 4444', 'Santiago', '2023-05-10', 1),
('18.444.444-4', 'Ana', 'Silva', 'ana.silva@email.com', '+56 9 4444 5555', 'Ñuñoa', '2024-01-05', 1),
('19.555.555-5', 'Pedro', 'Rojas', NULL, NULL, 'Maipú', '2024-02-12', 1),
('20.666.666-6', 'Lucía', 'Fernández', 'lucia.f@email.com', '+56 9 6666 7777', 'Santiago', '2024-04-18', 1),
('21.777.777-7', 'Diego', 'Torres', 'diego.t@email.com', NULL, 'La Florida', '2024-06-01', 1),
('22.888.888-8', 'Camila', 'Morales', 'camila.m@email.com', '+56 9 8888 9999', 'Providencia', '2024-07-22', 1),
('23.999.999-9', 'José', 'Castro', NULL, '+56 9 9999 0000', 'Ñuñoa', '2024-08-10', 1),
('14.000.000-0', 'Francisca', 'Araya', 'francisca.a@email.com', NULL, 'Santiago', '2024-09-01', 1);

-- PRODUCTOS (10)
INSERT INTO productos (nombre, categoria, precio_unitario, stock, proveedor) VALUES
('Pan Marraqueta (Kg)', 'Panadería', 1990.00, 50, 'Panadería San José'),
('Leche Entera 1L', 'Lácteos', 1150.00, 30, 'Colun'),
('Queso Gauda 250g', 'Fiambres', 2890.00, 15, 'Soprole'),
('Bebida Cola 2L', 'Bebidas', 2100.00, 24, 'CCU'),
('Arroz Grado 1 (1Kg)', 'Abarrotes', 1450.00, 40, 'Tucapel'),
('Aceite Vegetal 900ml', 'Abarrotes', 2390.00, 8, 'Chef'),
('Detergente Líquido 1.5L', 'Limpieza', 4990.00, 5, 'Omo'),
('Jamún Pechuga Pavo 200g', 'Fiambres', 2490.00, 12, 'PF'),
('Yogurt Batido 120g', 'Lácteos', 390.00, 60, 'Soprole'),
('Néctar Durazno 1.5L', 'Bebidas', 1690.00, 18, 'Watts');

-- VENDEDORES (3)
INSERT INTO vendedores (rut, nombre, apellido, sueldo, fecha_contratacion) VALUES
('12.345.678-9', 'Manuel', 'Vargas', 650000.00, '2021-03-01'),
('13.876.543-2', 'Patricia', 'Soto', 580000.00, '2022-08-15'),
('14.555.666-7', 'Gonzalo', 'Tapia', 520000.00, '2023-11-01');

-- VENTAS (10 Boletas)
INSERT INTO ventas (cliente_id, vendedor_id, fecha_hora, metodo_pago, total, observacion) VALUES
(1, 1, '2025-03-01 09:15:00', 'Efectivo', 6030.00, 'Cliente frecuente'),
(2, 2, '2025-03-01 10:30:00', 'Tarjeta', 4990.00, NULL),
(3, 1, '2025-03-02 11:45:00', 'Efectivo', 3840.00, NULL),
(4, 3, '2025-03-02 14:20:00', 'Transferencia', 8830.00, 'Entrega a domicilio'),
(5, 2, '2025-03-03 16:00:00', 'Tarjeta', 2100.00, NULL),
(1, 3, '2025-03-03 18:10:00', 'Tarjeta', 7380.00, NULL),
(6, 1, '2025-03-04 08:50:00', 'Efectivo', 1990.00, NULL),
(7, 2, '2025-03-04 12:30:00', 'Tarjeta', 4880.00, 'Pedido por teléfono'),
(8, 3, '2025-03-05 15:15:00', 'Efectivo', 3540.00, NULL),
(2, 1, '2025-03-05 19:40:00', 'Transferencia', 2490.00, NULL);

-- DETALLE DE VENTAS
INSERT INTO detalle_ventas (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1990.00), -- Venta 1
(1, 2, 2, 1150.00),
(1, 9, 2, 390.00),
(2, 7, 1, 4990.00), -- Venta 2
(3, 3, 1, 2890.00), -- Venta 3
(3, 5, 1, 950.00),
(4, 6, 1, 2390.00), -- Venta 4
(4, 3, 1, 2890.00),
(4, 10, 2, 1690.00),
(5, 4, 1, 2100.00), -- Venta 5
(6, 8, 2, 2490.00), -- Venta 6
(6, 6, 1, 2390.00),
(7, 1, 1, 1990.00), -- Venta 7
(8, 2, 2, 1150.00), -- Venta 8
(8, 8, 1, 2490.00),
(9, 4, 1, 2100.00), -- Venta 9
(9, 5, 1, 1440.00),
(10, 8, 1, 2490.00);-- Venta 10