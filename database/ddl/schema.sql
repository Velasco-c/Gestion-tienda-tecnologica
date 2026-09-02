CREATE DATABASE IF NOT EXISTS techzone;
\c techzone;

CREATE TABLE IF NOT EXISTS clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
        CHECK (precio_unitario > 0),
    categoria_id INT NOT NULL,

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categorias(categoria_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    puesto VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS proveedores (
    proveedor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(10) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS inventario (
    inventario_id SERIAL PRIMARY KEY,
    producto_id INT NOT NULL,
    proveedor_id INT NOT NULL,
    stock_minimo INT NOT NULL
        CHECK (stock_minimo > 0),
    stock_actual INT NOT NULL
        CHECK (stock_actual >= 0),

    CONSTRAINT fk_inventario_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_inventario_proveedor
        FOREIGN KEY (proveedor_id)
        REFERENCES proveedores(proveedor_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_inventario_producto_proveedor
        UNIQUE (producto_id, proveedor_id)
);

CREATE TABLE IF NOT EXISTS ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    empleado_id INT NOT NULL,
    fecha_venta DATE NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado VARCHAR(40) NOT NULL,
    total DECIMAL(10,2) NOT NULL
        CHECK (total > 0),

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(cliente_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_venta_empleado
        FOREIGN KEY (empleado_id)
        REFERENCES empleados(empleado_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_fechas_venta
        CHECK (fecha_entrega >= fecha_venta),

    CONSTRAINT chk_estado_venta
        CHECK (
            estado IN (
                'Pendiente',
                'Procesando',
                'Enviado',
                'Entregado',
                'Cancelado'
            )
        )
);

CREATE TABLE IF NOT EXISTS detalle_ventas (
    detalle_id SERIAL PRIMARY KEY,
    venta_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL
        CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL
        CHECK (precio_unitario > 0),

    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (venta_id)
        REFERENCES ventas(venta_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_detalle_venta_producto
        UNIQUE (venta_id, producto_id)
);