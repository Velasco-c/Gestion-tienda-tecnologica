### Modelo mejorado

* **clientes**

  * `id_cliente` — PK
  * `nombre`
  * `apellido`
  * `email` — UNIQUE
  * `telefono`

* **categorias**

  * `id_categoria` — PK
  * `nombre` — UNIQUE

* **productos**

  * `id_producto` — PK
  * `nombre`
  * `precio_unitario`
  * `id_categoria` — FK

* **empleados**

  * `id_empleado` — PK
  * `nombre`
  * `apellido`
  * `puesto`

* **inventario**

  * `id_inventario` — PK
  * `id_producto` — FK
  * `stock_actual`
  * `stock_minimo

* **pedidos**

  * `id_pedido` — PK
  * `id_cliente` — FK
  * `id_empleado` — FK
  * `fecha_pedido`
  * `fecha_entrega`
  * `estado`
  * `total`

* **detalle_pedido**

  * `id_detalle` — PK
  * `id_pedido` — FK
  * `id_producto` — FK
  * `cantidad`
  * `precio_unitario`
  * `subtotal`

* **proveedores**

  * `id_proveedor` — PK
  * `nombre`
  * `telefono`
  * `email`
  * `direccion`

### Mermaid ER

```mermaid
  erDiagram

    CLIENTES {
        int id_cliente PK
        varchar nombre
        varchar apellido
        varchar email UK
        varchar telefono
    }

    CATEGORIAS {
        int id_categoria PK
        varchar nombre UK
    }

    PRODUCTOS {
        int id_producto PK
        varchar nombre
        decimal precio_unitario
        int id_categoria FK
    }

    EMPLEADOS {
        int id_empleado PK
        varchar nombre
        varchar apellido
        varchar puesto
    }

    INVENTARIO {
        int id_inventario PK
        int id_producto FK
        int stock_actual
        int stock_minimo
    }

    PEDIDOS {
        int id_pedido PK
        int id_cliente FK
        int id_empleado FK
        date fecha_pedido
        date fecha_entrega
        varchar estado
        decimal total
    }

    DETALLE_PEDIDO {
        int id_detalle PK
        int id_pedido FK
        int id_producto FK
        int cantidad
        decimal precio_unitario
        decimal subtotal
    }

    PROVEEDORES {
        int id_proveedor PK
        varchar nombre
        varchar telefono
        varchar email
        varchar direccion
    }

    PROVEEDOR_PRODUCTO {
        int id_proveedor FK
        int id_producto FK
        date fecha_entrega
        int cantidad
    }


    CATEGORIAS ||--o{ PRODUCTOS : contiene

    PRODUCTOS ||--|| INVENTARIO : posee

    CLIENTES ||--o{ PEDIDOS : realiza

    EMPLEADOS ||--o{ PEDIDOS : gestiona

    PEDIDOS ||--|{ DETALLE_PEDIDO : contiene

    PRODUCTOS ||--o{ DETALLE_PEDIDO : incluye

    PROVEEDORES ||--o{ PROVEEDOR_PRODUCTO : suministra

    PRODUCTOS ||--o{ PROVEEDOR_PRODUCTO : es_suministrado

```

### Relaciones principales

```text
CATEGORIA
    │
    └── 1:N ── PRODUCTO
                   │
                   ├── 1:1 ── INVENTARIO
                   │
                   └── 1:N ── DETALLE_PEDIDO ── N:1 ── PEDIDO
                                                        │
                                                        ├── N:1 ── CLIENTE
                                                        │
                                                        └── N:1 ── EMPLEADO

PROVEEDOR
    │
    └── N:M ── PRODUCTO
          mediante PROVEEDOR_PRODUCTO
```

