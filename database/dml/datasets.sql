\c techzone
-- ============================================================
-- 1. CLIENTES
-- ============================================================

INSERT INTO clientes
(nombre, apellido, email, telefono)
VALUES
('Carlos', 'Mendoza', 'carlos.mendoza@example.com', '5551000001'),
('Ana', 'López', 'ana.lopez@example.com', '5551000002'),
('Luis', 'Ramírez', 'luis.ramirez@example.com', '5551000003'),
('María', 'Gómez', 'maria.gomez@example.com', '5551000004'),
('Jorge', 'Castillo', 'jorge.castillo@example.com', '5551000005'),
('Sofía', 'Hernández', 'sofia.hernandez@example.com', '5551000006'),
('Diego', 'Morales', 'diego.morales@example.com', '5551000007'),
('Laura', 'Vásquez', 'laura.vasquez@example.com', '5551000008'),
('Andrés', 'Torres', 'andres.torres@example.com', '5551000009'),
('Valentina', 'Cruz', 'valentina.cruz@example.com', '5551000010'),
('Fernando', 'Ortiz', 'fernando.ortiz@example.com', '5551000011'),
('Gabriela', 'Reyes', 'gabriela.reyes@example.com', '5551000012'),
('Ricardo', 'Navarro', 'ricardo.navarro@example.com', '5551000013'),
('Daniela', 'Fuentes', 'daniela.fuentes@example.com', '5551000014'),
('Miguel', 'Santos', 'miguel.santos@example.com', '5551000015');


-- ============================================================
-- 2. CATEGORÍAS
-- ============================================================

INSERT INTO categorias
(nombre)
VALUES
('Laptops'),
('Computadoras de escritorio'),
('Monitores'),
('Teclados'),
('Mouse'),
('Auriculares'),
('Impresoras'),
('Almacenamiento'),
('Memorias RAM'),
('Tarjetas gráficas'),
('Procesadores'),
('Placas madre'),
('Fuentes de poder'),
('Accesorios'),
('Redes');


-- ============================================================
-- 3. PRODUCTOS
-- ============================================================

INSERT INTO productos
(nombre, precio_unitario, categoria_id)
VALUES
('Laptop Lenovo IdeaPad 3', 649.99, 1),
('Laptop ASUS VivoBook 15', 729.50, 1),
('PC Gamer TechZone X1', 1249.99, 2),
('PC Oficina TechZone O1', 699.99, 2),
('Monitor Samsung 24"', 189.99, 3),
('Monitor LG UltraWide 29"', 329.99, 3),
('Teclado Mecánico Redragon', 59.99, 4),
('Teclado Logitech K380', 39.99, 4),
('Mouse Logitech G203', 34.99, 5),
('Mouse Razer DeathAdder', 69.99, 5),
('Auriculares HyperX Cloud II', 89.99, 6),
('Impresora HP LaserJet', 219.99, 7),
('SSD Kingston 1TB', 84.99, 8),
('Memoria RAM Kingston 16GB', 44.99, 9),
('Tarjeta gráfica RTX 4060', 319.99, 10);


-- ============================================================
-- 4. EMPLEADOS
-- ============================================================

INSERT INTO empleados
(nombre, apellido, puesto)
VALUES
('Alejandro', 'Pérez', 'Gerente de ventas'),
('Beatriz', 'Martínez', 'Asesora de ventas'),
('Cristian', 'García', 'Asesor de ventas'),
('Diana', 'Rodríguez', 'Supervisora de ventas'),
('Eduardo', 'Fernández', 'Administrador'),
('Fernanda', 'González', 'Asesora de ventas'),
('Gabriel', 'Díaz', 'Técnico de soporte'),
('Héctor', 'Sánchez', 'Asesor de ventas'),
('Isabel', 'Ramírez', 'Encargada de inventario'),
('Juan', 'Vega', 'Técnico de soporte'),
('Karen', 'Molina', 'Asesora de ventas'),
('Leonardo', 'Castro', 'Encargado de almacén'),
('Mónica', 'Ríos', 'Supervisora de almacén'),
('Nicolás', 'Aguilar', 'Asesor de ventas'),
('Patricia', 'Mejía', 'Administradora');


-- ============================================================
-- 5. PROVEEDORES
-- ============================================================

INSERT INTO proveedores
(nombre, apellido, email, telefono, direccion)
VALUES
('Roberto', 'Herrera', 'roberto.herrera@proveedor.com', '5552000001', 'Zona 1, Ciudad de Guatemala'),
('Silvia', 'Méndez', 'silvia.mendez@proveedor.com', '5552000002', 'Zona 2, Ciudad de Guatemala'),
('Oscar', 'Pineda', 'oscar.pineda@proveedor.com', '5552000003', 'Zona 3, Ciudad de Guatemala'),
('Claudia', 'Salazar', 'claudia.salazar@proveedor.com', '5552000004', 'Zona 4, Ciudad de Guatemala'),
('Mario', 'Cifuentes', 'mario.cifuentes@proveedor.com', '5552000005', 'Zona 5, Ciudad de Guatemala'),
('Rosa', 'Velásquez', 'rosa.velasquez@proveedor.com', '5552000006', 'Zona 6, Ciudad de Guatemala'),
('Esteban', 'Maldonado', 'esteban.maldonado@proveedor.com', '5552000007', 'Zona 7, Ciudad de Guatemala'),
('Julia', 'Arriola', 'julia.arriola@proveedor.com', '5552000008', 'Zona 8, Ciudad de Guatemala'),
('Sergio', 'Lemus', 'sergio.lemus@proveedor.com', '5552000009', 'Zona 9, Ciudad de Guatemala'),
('Paola', 'Escobar', 'paola.escobar@proveedor.com', '5552000010', 'Zona 10, Ciudad de Guatemala'),
('Mauricio', 'Ibarra', 'mauricio.ibarra@proveedor.com', '5552000011', 'Zona 11, Ciudad de Guatemala'),
('Verónica', 'Chávez', 'veronica.chavez@proveedor.com', '5552000012', 'Zona 12, Ciudad de Guatemala'),
('Rafael', 'Barrera', 'rafael.barrera@proveedor.com', '5552000013', 'Zona 13, Ciudad de Guatemala'),
('Lorena', 'Cabrera', 'lorena.cabrera@proveedor.com', '5552000014', 'Zona 14, Ciudad de Guatemala'),
('Tomás', 'Alvarado', 'tomas.alvarado@proveedor.com', '5552000015', 'Zona 15, Ciudad de Guatemala');


-- ============================================================
-- 6. INVENTARIO
-- ============================================================

INSERT INTO inventario
(producto_id, proveedor_id, stock_minimo, stock_actual)
VALUES
(1, 1, 5, 18),
(2, 2, 5, 22),
(3, 3, 3, 8),
(4, 4, 5, 15),
(5, 5, 8, 30),
(6, 6, 5, 12),
(7, 7, 10, 35),
(8, 8, 10, 28),
(9, 9, 15, 45),
(10, 10, 8, 20),
(11, 11, 5, 16),
(12, 12, 5, 10),
(13, 13, 10, 25),
(14, 14, 12, 40),
(15, 15, 3, 7);


-- ============================================================
-- 7. VENTAS
-- ============================================================

INSERT INTO ventas
(cliente_id, empleado_id, fecha_venta, fecha_entrega, estado, total)
VALUES
(1, 1, '2026-08-01', '2026-08-03', 'Entregado', 649.99),
(2, 2, '2026-08-02', '2026-08-05', 'Entregado', 729.50),
(3, 3, '2026-08-03', '2026-08-06', 'Entregado', 189.99),
(4, 4, '2026-08-04', '2026-08-07', 'Entregado', 329.99),
(5, 5, '2026-08-05', '2026-08-08', 'Entregado', 1249.99),
(6, 6, '2026-08-06', '2026-08-09', 'Enviado', 99.98),
(7, 7, '2026-08-07', '2026-08-10', 'Procesando', 89.99),
(8, 8, '2026-08-08', '2026-08-11', 'Entregado', 219.99),
(9, 9, '2026-08-09', '2026-08-12', 'Entregado', 84.99),
(10, 10, '2026-08-10', '2026-08-13', 'Enviado', 44.99),
(11, 11, '2026-08-11', '2026-08-14', 'Procesando', 319.99),
(12, 12, '2026-08-12', '2026-08-15', 'Entregado', 699.99),
(13, 13, '2026-08-13', '2026-08-16', 'Cancelado', 69.99),
(14, 14, '2026-08-14', '2026-08-17', 'Procesando', 74.98),
(15, 15, '2026-08-15', '2026-08-18', 'Enviado', 189.99);


-- ============================================================
-- 8. DETALLE DE VENTAS
-- ============================================================

INSERT INTO detalle_ventas
(venta_id, producto_id, cantidad, precio_unitario)
VALUES
(1, 1, 1, 649.99),
(2, 2, 1, 729.50),
(3, 5, 1, 189.99),
(4, 6, 1, 329.99),
(5, 3, 1, 1249.99),
(6, 7, 1, 1 * 59.99),
(6, 8, 1, 39.99),
(7, 11, 1, 89.99),
(8, 12, 1, 219.99),
(9, 13, 1, 84.99),
(10, 14, 1, 44.99),
(11, 15, 1, 319.99),
(12, 4, 1, 699.99),
(13, 10, 1, 69.99),
(14, 9, 1, 34.99),
(14, 8, 1, 39.99),
(15, 5, 1, 189.99);