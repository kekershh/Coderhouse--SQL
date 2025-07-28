DROP DATABASE IF EXISTS arepas_aparicio;
CREATE DATABASE arepas_aparicio;
USE arepas_aparicio;

-- Tabla de clientes
CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    telefono VARCHAR(20)
);

-- Tabla de productos (ej. arepas rellenas, combos, bebidas, etc.)
CREATE TABLE producto (
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2)
);

-- Tabla de ingredientes
CREATE TABLE ingrediente (
    id_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    unidad_medida VARCHAR(50)
);

-- Tabla de proveedores
CREATE TABLE proveedor (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(150)
);

-- Precios de ingredientes según proveedor
CREATE TABLE precio_ingrediente (
    id_precio_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_ingrediente INT,
    id_proveedor INT,
    precio_unitario DECIMAL(10,2),
    fecha_registro DATE,
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Relación muchos a muchos entre producto e ingrediente
CREATE TABLE producto_ingrediente (
    id_producto_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    id_ingrediente INT,
    cantidad_usada DECIMAL(10,2),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente)
);

-- Tabla de movimientos de caja (ingresos/ventas)
CREATE TABLE movimiento_caja (
    id_movimiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_movimiento ENUM('VENTA', 'GASTO') NOT NULL,
    monto DECIMAL(10,2),
    descripcion TEXT,
    fecha_movimiento DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla puente que relaciona ventas específicas con productos y clientes
CREATE TABLE detalle_venta (
    id_detalle_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_movimiento INT,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    fecha_venta DATE,
    FOREIGN KEY (id_movimiento) REFERENCES movimiento_caja(id_movimiento),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
