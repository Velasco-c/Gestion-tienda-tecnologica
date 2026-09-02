CREATE DATABASE IF NOT EXISTS techzone;
\c techzone

CREATE TABLE IF NOT EXISTS clientes (
  cliente_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  telefono VARCHAR(10) NOT NULL 
);

CREATE TABLE IF NOT EXISTS categorias(
  categoria_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS productos(
  producto_id SERIAL PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  precio_unitario DECIMAL NOT NULL CHECK(precio_unitario > 0),
  categoria_id INT NOT NULL,
  CONSTRAINT fk_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categorias(categoria_id)
);

CREATE TABLE IF NOT EXISTS empleados(
  empleado_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  puesto VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS proveedores(
  proveedor_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  telefono VARCHAR(10) NOT NULL,
  direccion VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS inventario(
  inventario_id SERIAL PRIMARY KEY,
  producto_id INT NOT NULL,
  proveedor_id INT NOT NULL,
  stock_minimo INT NOT NULL CHECK(stock_minimo > 0),
  stock_actual INT NOT NULL CHECK(stock_actual > 0),
  CONSTRAINT fk_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id),
  CONSTRAINT fk_proveedor
        FOREIGN KEY (proveedor_id)
        REFERENCES proveedores(proveedor_id)
);

CREATE TABLE IF NOT EXISTS pedidos(
  pedido_id SERIAL PRIMARY KEY,
  cliente_id INT NOT NULL,
  empleado_id INT NOT NULL,
  fecha_pedido DATE NOT NULL,
  fecha_entrega DATE NOT NULL,
  estado VARCHAR(40) NOT NULL,
  total DECIMAL NOT NULL CHECK(total > 0),
  CONSTRAINT fk_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(cliente_id),
  CONSTRAINT fk_empleado
        FOREIGN KEY (empleado_id)
        REFERENCES empleados(empleado_id)
);

CREATE TABLE IF NOT EXISTS detalle_pedido(
  detalle_id SERIAL PRIMARY KEY,
  pedido_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL CHECK(cantidad > 0),
  precio_unitario DECIMAL NOT NULL CHECK(precio_unitario > 0),
  CONSTRAINT fk_producto_dp
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id),
  CONSTRAINT fk_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(pedido_id)
);
