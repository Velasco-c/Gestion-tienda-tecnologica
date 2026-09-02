/*
    Un procedimiento almacenado para registrar una venta.
    Implementación de transacciones (COMMIT y ROLLBACK) para:
    Validar que el cliente exista.
    Verificar que el stock sea suficiente antes de procesar la venta.
    Si no hay stock suficiente, se hace un ROLLBACK para cancelar la venta.
    Si hay stock, se realiza un COMMIT para confirmar la transacción.
*/


CREATE PROCEDURE registrar_venta (
    r_stock INT,
    r_cliente_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT c.nombre, v.fecha
END;
$$;