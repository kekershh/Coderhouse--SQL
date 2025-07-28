-- Base de datos
CREATE DATABASE IF NOT EXISTS tienda_arepas;
USE tienda_arepas;

-- Tabla 1: Cliente
CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(20),
  direccion VARCHAR(255),
  correo VARCHAR(100)
);

-- Tabla 2: Producto
CREATE TABLE producto (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  precio_unitario DECIMAL(10,2)
);

-- Tabla 3: Venta
CREATE TABLE venta (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  id_cliente INT,
  total_venta DECIMAL(10,2),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabla 4: Detalle_Venta
CREATE TABLE detalle_venta (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT,
  id_producto INT,
  cantidad INT,
  subtotal DECIMAL(10,2),
  FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla 5: Caja
CREATE TABLE caja (
  id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  tipo_movimiento ENUM('Ingreso', 'Egreso'),
  descripcion TEXT,
  monto DECIMAL(10,2)
);

-- Tabla 6: Ingrediente
CREATE TABLE ingrediente (
  id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  unidad_medida VARCHAR(20)
);

-- Tabla 7: Proveedor
CREATE TABLE proveedor (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(20),
  correo VARCHAR(100)
);

-- Tabla 8: Ingrediente_Proveedor
CREATE TABLE ingrediente_proveedor (
  id_ing_prov INT AUTO_INCREMENT PRIMARY KEY,
  id_ingrediente INT,
  id_proveedor INT,
  precio_unitario DECIMAL(10,2),
  FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Tabla 9: Producto_Ingrediente
CREATE TABLE producto_ingrediente (
  id_producto_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT,
  id_ingrediente INT,
  cantidad_usada DECIMAL(10,2),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente)
);

-- Tabla 10: Transaccion
CREATE TABLE transaccion (
  id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  id_movimiento INT,
  id_producto INT,
  cantidad INT,
  precio_unitario DECIMAL(10,2),
  subtotal DECIMAL(10,2),
  FOREIGN KEY (id_movimiento) REFERENCES caja(id_movimiento),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
