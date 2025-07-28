# Coderhouse--SQL

# 🧺 ArepasDB_Aparicio

Este proyecto tiene como finalidad diseñar una base de datos relacional en **MySQL** para una tienda de arepas artesanal, un negocio familiar que opera en Colombia. La base de datos busca digitalizar y organizar los procesos básicos del negocio: ventas, registro de clientes, movimientos de caja, manejo de proveedores, ingredientes y control de producción.

---

## 📌 Índice

- [Introducción](#introducción)
- [Objetivo](#objetivo)
- [Situación problemática](#situación-problemática)
- [Modelo de negocio](#modelo-de-negocio)
- [Listado de Tablas](#listado-de-tablas)
- [Diagrama Entidad-Relación (E-R)](#diagrama-entidad-relación-e-r)

---

## 📖 Introducción

La implementación de este sistema permitirá automatizar la recolección de datos, facilitar el análisis de ventas y márgenes, mejorar la trazabilidad de productos, y generar reportes que apoyen la toma de decisiones del negocio.

---

## 🎯 Objetivo

Desarrollar una base de datos funcional en MySQL que:

- Registre productos y sus ingredientes.
- Controle proveedores y costos de materia prima.
- Registre cada transacción de venta junto con sus movimientos de caja.
- Vincule la información comercial y contable.
- Sirva como base para reportes futuros de ventas, costos y ganancias.

---

## ⚠️ Situación problemática

Actualmente, el negocio lleva sus registros manualmente, lo cual limita el control financiero y operativo. Es difícil conocer:

- Qué productos se venden más.
- Cuánto dinero entra por día.
- Cuánto cuesta producir cada arepa.
- Cuál es el margen de ganancia por unidad.

Una base de datos relacional soluciona estos problemas mediante la centralización de la información y permite mejorar la gestión del negocio.

---

## 🏪 Modelo de negocio

La tienda vende arepas artesanales directamente al público, con distintos tipos de productos. Utiliza ingredientes comprados a proveedores y cada venta genera un ingreso en caja. Las áreas cubiertas por la base de datos son:

- Ventas
- Caja (contabilidad)
- Clientes
- Productos y sus ingredientes
- Proveedores
- Recetas y costos

---

## 📋 Listado de Tablas

### 1. `Cliente`

| Campo       | Descripción           | Tipo de dato   | Clave |
|-------------|-----------------------|----------------|-------|
| id_cliente  | ID del cliente        | INT            | PK    |
| nombre      | Nombre del cliente    | VARCHAR(100)   |       |
| telefono    | Teléfono              | VARCHAR(20)    |       |
| direccion   | Dirección             | VARCHAR(255)   |       |
| correo      | Correo electrónico    | VARCHAR(100)   |       |

---

### 2. `Producto`

| Campo            | Descripción              | Tipo de dato     | Clave |
|------------------|--------------------------|------------------|-------|
| id_producto       | ID del producto          | INT              | PK    |
| nombre            | Nombre del producto      | VARCHAR(100)     |       |
| descripcion       | Descripción del producto | TEXT             |       |
| precio_unitario   | Precio de venta          | DECIMAL(10,2)    |       |

---

### 3. `Venta`

| Campo         | Descripción           | Tipo de dato     | Clave |
|---------------|-----------------------|------------------|-------|
| id_venta      | ID de la venta        | INT              | PK    |
| fecha         | Fecha de la venta     | DATE             |       |
| id_cliente    | Cliente que compró    | INT (FK)         | FK    |
| total_venta   | Total de la venta     | DECIMAL(10,2)    |       |

---

### 4. `Detalle_Venta`

| Campo         | Descripción         | Tipo de dato     | Clave |
|---------------|---------------------|------------------|-------|
| id_detalle    | ID del detalle      | INT              | PK    |
| id_venta      | ID de la venta      | INT (FK)         | FK    |
| id_producto   | ID del producto     | INT (FK)         | FK    |
| cantidad      | Cantidad comprada   | INT              |       |
| subtotal      | Total por producto  | DECIMAL(10,2)    |       |

---

### 5. `Caja`

| Campo           | Descripción             | Tipo de dato     | Clave |
|------------------|-------------------------|------------------|-------|
| id_movimiento     | ID del movimiento       | INT              | PK    |
| fecha             | Fecha del movimiento    | DATE             |       |
| tipo_movimiento   | Ingreso o Egreso        | ENUM             |       |
| descripcion       | Descripción             | TEXT             |       |
| monto             | Valor del movimiento    | DECIMAL(10,2)    |       |

---

### 6. `Ingrediente`

| Campo          | Descripción             | Tipo de dato     | Clave |
|----------------|-------------------------|------------------|-------|
| id_ingrediente | ID del ingrediente      | INT              | PK    |
| nombre         | Nombre del ingrediente  | VARCHAR(100)     |       |
| unidad_medida  | Unidad de medida        | VARCHAR(20)      |       |

---

### 7. `Proveedor`

| Campo         | Descripción            | Tipo de dato     | Clave |
|---------------|------------------------|------------------|-------|
| id_proveedor  | ID del proveedor       | INT              | PK    |
| nombre        | Nombre del proveedor   | VARCHAR(100)     |       |
| telefono      | Teléfono               | VARCHAR(20)      |       |
| correo        | Correo electrónico     | VARCHAR(100)     |       |

---

### 8. `Ingrediente_Proveedor`

| Campo             | Descripción           | Tipo de dato     | Clave |
|-------------------|-----------------------|------------------|-------|
| id_ing_prov       | ID de la relación     | INT              | PK    |
| id_ingrediente    | Ingrediente           | INT (FK)         | FK    |
| id_proveedor      | Proveedor             | INT (FK)         | FK    |
| precio_unitario   | Precio unitario       | DECIMAL(10,2)    |       |

---

### 9. `Producto_Ingrediente`

| Campo                   | Descripción                 | Tipo de dato     | Clave |
|-------------------------|-----------------------------|------------------|-------|
| id_producto_ingrediente | ID de la relación           | INT              | PK    |
| id_producto             | Producto                    | INT (FK)         | FK    |
| id_ingrediente          | Ingrediente                 | INT (FK)         | FK    |
| cantidad_usada          | Cantidad usada              | DECIMAL(10,2)    |       |

---

### 10. `Transaccion`

| Campo            | Descripción                     | Tipo de dato     | Clave |
|------------------|---------------------------------|------------------|-------|
| id_transaccion   | ID de la transacción            | INT              | PK    |
| fecha            | Fecha de la transacción         | DATE             |       |
| id_movimiento    | Movimiento de caja relacionado  | INT (FK)         | FK    |
| id_producto      | Producto vendido                | INT (FK)         | FK    |
| cantidad         | Cantidad vendida                | INT              |       |
| precio_unitario  | Precio aplicado                 | DECIMAL(10,2)    |       |
| subtotal         | Total de la venta parcial       | DECIMAL(10,2)    |       |

---

## 🧠 Diagrama Entidad-Relación (E-R)

Puedes visualizar el diagrama completo aquí:

🔗 [Ver Diagrama en dbdiagram.io][(https://dbdiagram.io/d/La-Arepa-6887ad82cca18e685c1a124d)

---

## 👩‍💻 Script SQL

Consulta el archivo `script.sql` incluido en este repositorio para ver la creación completa de la base de datos en MySQL.

---

## ✍ Autora

Angelica Aparicio – Proyecto Final SQL  
Tienda de Arepas | Julio 2025

