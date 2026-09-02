-- ============================================================
-- 1. Listar los productos con stock menor a 5 unidades
-- ============================================================

SELECT
    p.nombre,
    p.precio_unitario,
    i.stock_actual
FROM inventario i
INNER JOIN productos p
    ON p.producto_id = i.producto_id
WHERE i.stock_actual < 5;


-- ============================================================
-- 2. Calcular ventas totales de un mes específico
-- Ejemplo: agosto de 2026
-- ============================================================

SELECT
    SUM(total) AS ventas_totales
FROM ventas
WHERE fecha_venta >= '2026-08-01'
  AND fecha_venta < '2026-09-01';


-- ============================================================
-- 3. Registro de ventas
-- Mostrar productos, cantidad, cliente y fecha de venta
-- ============================================================

SELECT
    v.venta_id,
    c.nombre || ' ' || c.apellido AS cliente,
    p.nombre AS producto,
    dv.cantidad,
    dv.precio_unitario,
    v.fecha_venta,
    v.estado
FROM ventas v
INNER JOIN clientes c
    ON c.cliente_id = v.cliente_id
INNER JOIN detalle_ventas dv
    ON dv.venta_id = v.venta_id
INNER JOIN productos p
    ON p.producto_id = dv.producto_id
ORDER BY v.venta_id;


-- ============================================================
-- 4. Listar los productos más vendidos
-- Ordenados de mayor a menor cantidad vendida
-- ============================================================

SELECT
    p.producto_id,
    p.nombre AS producto,
    SUM(dv.cantidad) AS cantidad_vendida
FROM detalle_ventas dv
INNER JOIN productos p
    ON p.producto_id = dv.producto_id
INNER JOIN ventas v
    ON v.venta_id = dv.venta_id
WHERE v.estado <> 'Cancelado'
GROUP BY
    p.producto_id,
    p.nombre
ORDER BY cantidad_vendida DESC;


-- ============================================================
-- 5. Consultar ventas realizadas en un rango de fechas
-- Ejemplo: del 1 al 10 de agosto de 2026
-- ============================================================

SELECT
    v.venta_id,
    c.nombre || ' ' || c.apellido AS cliente,
    v.fecha_venta,
    v.estado,
    v.total
FROM ventas v
INNER JOIN clientes c
    ON c.cliente_id = v.cliente_id
WHERE v.fecha_venta BETWEEN '2026-08-01' AND '2026-08-10'
ORDER BY v.fecha_venta;


-- ============================================================
-- 6. Identificar clientes que no han comprado
-- en los últimos 6 meses
-- ============================================================

SELECT
    c.cliente_id,
    c.nombre,
    c.apellido,
    c.email
FROM clientes c
LEFT JOIN ventas v
    ON v.cliente_id = c.cliente_id
    AND v.fecha_venta >= CURRENT_DATE - INTERVAL '6 months'
WHERE v.venta_id IS NULL
ORDER BY c.cliente_id;