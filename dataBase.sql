CREATE DATABASE AlmacenDB;
USE AlmacenDB;

CREATE DATABASE AlmacenDB;
USE AlmacenDB;

CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(255) NOT NULL,
    contacto VARCHAR(255),
    telefono VARCHAR(50),
    direccion VARCHAR(255)
);

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL,
    correo_cliente VARCHAR(255),
    telefono_cliente VARCHAR(50),
    direccion_cliente VARCHAR(255)
);

CREATE TABLE Ordenes_Compra (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    fecha_orden DATE,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Detalle_Orden_Compra (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_orden) REFERENCES Ordenes_Compra(id_orden),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_venta DATE,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalle_Ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(255) NOT NULL,
    puesto VARCHAR(100),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);

INSERT INTO Proveedores (nombre_proveedor, contacto, telefono, direccion)
VALUES ('Proveedor Ejemplo', 'Juan Perez', '555-1234', 'Calle Falsa 123');

SELECT * FROM Proveedores;
SELECT * FROM Proveedores WHERE id_proveedor = 1;

