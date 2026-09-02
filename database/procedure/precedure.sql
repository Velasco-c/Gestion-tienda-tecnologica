-- Cambio: se reemplazó el procedimiento incompleto por uno funcional para registrar ventas y actualizar inventario.

DROP PROCEDURE IF EXISTS registrar_venta(INT, INT, INT, INT);

CREATE OR REPLACE PROCEDURE registrar_venta (
    p_cliente_id INT,
    p_empleado_id INT,
    p_producto_id INT,
    p_cantidad INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_precio DECIMAL(10,2);
    v_stock INT;
    v_total DECIMAL(10,2);
    v_venta_id INT;
BEGIN
    IF p_cantidad <= 0 THEN
        RAISE EXCEPTION 'La cantidad debe ser mayor que cero';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM clientes
        WHERE cliente_id = p_cliente_id
    ) THEN
        RAISE EXCEPTION 'El cliente % no existe', p_cliente_id;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM empleados
        WHERE empleado_id = p_empleado_id
    ) THEN
        RAISE EXCEPTION 'El empleado % no existe', p_empleado_id;
    END IF;

    SELECT
        p.precio_unitario,
        i.stock_actual
    INTO
        v_precio,
        v_stock
    FROM productos p
    INNER JOIN inventario i
        ON i.producto_id = p.producto_id
    WHERE p.producto_id = p_producto_id
    FOR UPDATE OF i;

    IF NOT FOUND THEN
        RAISE EXCEPTION
            'El producto % no existe o no tiene inventario',
            p_producto_id;
    END IF;

    IF v_stock < p_cantidad THEN
        RAISE EXCEPTION
            'Stock insuficiente para el producto %. Disponible: %, solicitado: %',
            p_producto_id,
            v_stock,
            p_cantidad;
    END IF;

    v_total := v_precio * p_cantidad;

    INSERT INTO ventas (
        cliente_id,
        empleado_id,
        fecha_venta,
        fecha_entrega,
        estado,
        total
    )
    VALUES (
        p_cliente_id,
        p_empleado_id,
        CURRENT_DATE,
        CURRENT_DATE + 3,
        'Procesando',
        v_total
    )
    RETURNING venta_id INTO v_venta_id;

    INSERT INTO detalle_ventas (
        venta_id,
        producto_id,
        cantidad,
        precio_unitario
    )
    VALUES (
        v_venta_id,
        p_producto_id,
        p_cantidad,
        v_precio
    );

    UPDATE inventario
    SET stock_actual = stock_actual - p_cantidad
    WHERE producto_id = p_producto_id;

    RAISE NOTICE
        'Venta % registrada correctamente. Total: %',
        v_venta_id,
        v_total;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION
            'No fue posible registrar la venta por una restricción de unicidad';
END;
$$;

-- Prueba:
CALL registrar_venta(1, 1, 1, 2);
