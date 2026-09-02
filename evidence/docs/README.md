````markdown
# Evidencias — Gestión de Tienda Tecnológica

## Modelo de datos

El modelo representa la gestión de una tienda tecnológica mediante las siguientes entidades:

- **Clientes:** información de los compradores.
- **Categorías:** clasificación de los productos.
- **Productos:** catálogo de productos y precios.
- **Empleados:** personal encargado de gestionar las ventas.
- **Proveedores:** información de los proveedores.
- **Inventario:** existencia disponible de cada producto y proveedor.
- **Ventas:** información general de cada venta.
- **Detalle de ventas:** productos, cantidades y precios asociados a una venta.

## Diagrama entidad-relación

```mermaid
erDiagram
    CATEGORIAS ||--o{ PRODUCTOS : contiene
    PRODUCTOS ||--|| INVENTARIO : posee
    PROVEEDORES ||--o{ INVENTARIO : suministra
    CLIENTES ||--o{ VENTAS : realiza
    EMPLEADOS ||--o{ VENTAS : gestiona
    VENTAS ||--|{ DETALLE_VENTAS : contiene
    PRODUCTOS ||--o{ DETALLE_VENTAS : incluye

    CATEGORIAS {
        int categoria_id PK
        varchar nombre UK
    }

    PRODUCTOS {
        int producto_id PK
        varchar nombre
        decimal precio_unitario
        int categoria_id FK
    }

    CLIENTES {
        int cliente_id PK
        varchar nombre
        varchar apellido
        varchar email UK
        varchar telefono
    }

    EMPLEADOS {
        int empleado_id PK
        varchar nombre
        varchar apellido
        varchar puesto
    }

    PROVEEDORES {
        int proveedor_id PK
        varchar nombre
        varchar apellido
        varchar email UK
        varchar telefono
        varchar direccion
    }

    INVENTARIO {
        int inventario_id PK
        int producto_id FK
        int proveedor_id FK
        int stock_minimo
        int stock_actual
    }

    VENTAS {
        int venta_id PK
        int cliente_id FK
        int empleado_id FK
        date fecha_venta
        date fecha_entrega
        varchar estado
        decimal total
    }

    DETALLE_VENTAS {
        int detalle_id PK
        int venta_id FK
        int producto_id FK
        int cantidad
        decimal precio_unitario
        decimal subtotal
    }
````

## Procedimiento almacenado

El procedimiento `registrar_venta` permite registrar una venta y actualizar el inventario correspondiente.

Antes de realizar la operación verifica:

* existencia del cliente;
* existencia del empleado;
* existencia del producto;
* cantidad solicitada;
* disponibilidad del inventario.

Posteriormente:

1. obtiene el precio y stock del producto;
2. calcula el total;
3. registra la venta;
4. registra el detalle de la venta;
5. descuenta la cantidad correspondiente del inventario.

### Ejecución

```sql
CALL registrar_venta(1, 1, 1, 2);
```

Si alguna validación falla, la operación genera una excepción y no continúa con el registro de la venta.

## Cambios realizados

* Se completó el procedimiento almacenado que se encontraba incompleto.
* Se agregaron validaciones para clientes, empleados, productos y cantidades.
* Se agregó validación de stock disponible.
* Se incorporó bloqueo del registro de inventario durante la operación.
* Se agregó el registro de la venta y su detalle.
* Se agregó la actualización del stock.
* Se actualizó la documentación para coincidir con las tablas actuales del proyecto.
