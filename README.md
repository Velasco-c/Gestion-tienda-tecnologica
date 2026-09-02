# Gestión de Tienda Tecnológica

Sistema de base de datos relacional desarrollado en **PostgreSQL** para gestionar las operaciones principales de una tienda tecnológica.

El proyecto permite administrar **clientes, categorías, productos, empleados, proveedores, inventario y ventas**, utilizando relaciones entre tablas, claves primarias y foráneas, restricciones de integridad y un procedimiento almacenado para automatizar el registro de ventas.

---

El proyecto está organizado por responsabilidades para separar la **estructura, los datos, las consultas y la lógica de negocio** de la base de datos.

### Estructura de la base de datos

El archivo `database/ddl/schema.sql` define la estructura de la base de datos `techzone`. En él se crean las tablas principales y las relaciones entre ellas.

Las entidades principales son:

* **Clientes:** almacena la información de los compradores.
* **Categorías:** organiza los productos disponibles.
* **Productos:** contiene el catálogo, precios y categorías de los productos.
* **Empleados:** registra los empleados encargados de gestionar las ventas.
* **Proveedores:** almacena la información de los proveedores.
* **Inventario:** controla las existencias disponibles de cada producto.
* **Ventas:** registra las operaciones de compra realizadas.
* **Detalle de ventas:** especifica los productos y cantidades incluidos en cada venta.

Las relaciones entre estas tablas permiten mantener la integridad de la información y representar el flujo de una venta:

```text
Cliente
   │
   ▼
Venta ──────► Empleado
   │
   ▼
Detalle de venta
   │
   ▼
Producto ───► Categoría
   │
   ▼
Inventario
```

### Datos de prueba

El archivo `database/dml/datasets.sql` contiene datos sintéticos para poblar las tablas y permitir la ejecución de pruebas y consultas sobre la base de datos.

Estos datos representan clientes, productos, empleados, proveedores, inventario y ventas.

### Consultas SQL

El archivo `database/dql/queries.sql` contiene consultas para obtener información relevante del sistema, entre ellas:

* productos con stock bajo;
* ventas realizadas durante un período;
* información detallada de las ventas;
* productos más vendidos;
* ventas dentro de un rango de fechas;
* clientes sin compras recientes.

Estas consultas permiten analizar la información almacenada sin modificar los datos.

### Procedimiento para registrar ventas

El archivo `database/procedure/precedure.sql` contiene el procedimiento almacenado:

```sql
registrar_venta
```

Su objetivo es centralizar la lógica necesaria para registrar una venta.

El procedimiento recibe:

```sql
CALL registrar_venta(1, 1, 1, 2);
```

Los parámetros representan:

```text
cliente_id
empleado_id
producto_id
cantidad
```

Antes de registrar la operación, el procedimiento valida que:

1. La cantidad solicitada sea válida.
2. El cliente exista.
3. El empleado exista.
4. El producto exista.
5. El producto tenga inventario disponible.
6. El stock sea suficiente para la cantidad solicitada.

Si las validaciones son correctas, el procedimiento:

```text
Validar datos
     ↓
Obtener producto y precio
     ↓
Verificar stock
     ↓
Calcular total
     ↓
Crear venta
     ↓
Crear detalle de venta
     ↓
Actualizar inventario
```

De esta manera, una sola llamada permite registrar la venta, generar su detalle y descontar automáticamente del inventario las unidades vendidas.

## Flujo general del proyecto

La ejecución de los scripts sigue el flujo:

```text
schema.sql
    ↓
Crea la estructura
    ↓
datasets.sql
    ↓
Carga datos de prueba
    ↓
queries.sql
    ↓
Consulta y analiza la información
    ↓
procedure.sql
    ↓
Automatiza el registro de ventas
```

En conjunto, el repositorio demuestra la implementación de una base de datos relacional en PostgreSQL, desde la **creación del esquema y carga de datos hasta la consulta y automatización de operaciones mediante PL/pgSQL**.
