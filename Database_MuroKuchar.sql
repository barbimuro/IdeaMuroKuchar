CREATE DATABASE styles_by_bm;
USE styles_by_bm;

CREATE TABLE cliente (
id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_cliente VARCHAR(60),
dni_cliente VARCHAR(12),
telefono_cliente VARCHAR(15),
direccion_cliente VARCHAR(100),
email_cliente VARCHAR(80)
) COMMENT 'Datos del cliente';

CREATE TABLE proveedor (
id_proveedor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_proveedor VARCHAR(60),
cuit_proveedor VARCHAR(12),
telefono_proveedor VARCHAR(15),
direccion_proveedor VARCHAR(100),
email_proveedor VARCHAR(80)
) COMMENT 'Datos del proveedor';

CREATE TABLE categoria_producto (
id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR(60),
descripcion_categoria VARCHAR(300)
) COMMENT 'Descripcion categorias de productos';

CREATE TABLE producto (
id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR(60),
precio_producto DECIMAL(8,2),
descripcion_producto VARCHAR(300),
id_categoria INT UNSIGNED, -- fk
id_proveedor INT UNSIGNED -- fk
) COMMENT 'Datos del producto';

CREATE TABLE transaccion (
id_transaccion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_cliente INT UNSIGNED, -- fk
fecha_transaccion DATE DEFAULT(CURRENT_DATE),
monto_transaccion DECIMAL(8,2),
estado_transaccion ENUM('en preparacion','enviado', 'recibido', 'cancelado')
) COMMENT 'Datos de la transaccion';

CREATE TABLE detalle_transaccion (
id_detalle_transaccion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_transaccion INT UNSIGNED, -- fk
id_producto INT UNSIGNED, -- fk
cantidad_producto INT UNSIGNED,
precio_unitario DECIMAL(8,2)
) COMMENT 'Detalle de la transaccion';

ALTER TABLE   styles_by_bm.producto   ADD
FOREIGN KEY  (id_categoria)  REFERENCES styles_by_bm.categoria_producto(id_categoria);

ALTER TABLE   styles_by_bm.producto   ADD
FOREIGN KEY  (id_proveedor)  REFERENCES styles_by_bm.proveedor(id_proveedor);

ALTER TABLE styles_by_bm.transaccion  ADD
FOREIGN KEY  (id_cliente)  REFERENCES styles_by_bm.cliente(id_cliente);

ALTER TABLE   styles_by_bm.detalle_transaccion   ADD
FOREIGN KEY   (id_transaccion) REFERENCES styles_by_bm.transaccion(id_transaccion) ;

ALTER TABLE  styles_by_bm.detalle_transaccion     ADD
FOREIGN KEY   (id_producto)  REFERENCES styles_by_bm.producto(id_producto) ;

