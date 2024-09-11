
# Diseño y Modelado de Bases de Datos

Este repositorio incluye una explicación sobre los conceptos clave del diseño y modelado de bases de datos, destacando las etapas del proceso de diseño desde lo conceptual hasta lo físico.

## Contenido

1. **Diseño Conceptual**
   - Se enfoca en entender los requerimientos del negocio.
   - Representa la estructura lógica de la base de datos.
   - Utiliza el diagrama entidad-relación (ER) como herramienta común.
   - Identifica entidades, atributos y relaciones.

2. **Diseño Lógico**
   - Conversión del modelo conceptual a un formato compatible con SGBD.
   - Definición de tablas, llaves primarias, foráneas y restricciones.
   - Utiliza el modelo relacional para bases de datos tabulares.

3. **Normalización**
   - Organiza los datos para minimizar la redundancia y evitar la inconsistencia.
   - Aplica formas normales (hasta 3FN) para distribuir los datos adecuadamente en las tablas.

4. **Diseño Físico**
   - Implementación del diseño lógico en un sistema de gestión de bases de datos (MySQL, PostgreSQL, SQL Server, etc.).
   - Se decide sobre el tipo de índices, mecanismos de almacenamiento y estrategias de acceso a los datos.

5. **Modelado NoSQL**
   - El enfoque es en estructuras no tabulares (documentos, grafos, clave-valor, bases orientadas a columnas).
   - Optimiza consultas específicas en lugar de la normalización estricta.

6. **Integridad de los Datos**
   - Definición de restricciones y reglas para asegurar que los datos sean válidos, consistentes y completos.
   - La integridad referencial garantiza que las relaciones entre tablas se mantengan correctamente a través de claves foráneas.

7. **Escalabilidad y Rendimiento**
   - Consideración de cómo el diseño permitirá escalar la base de datos.
   - Uso de índices, particiones y replicación para mejorar la eficiencia y el manejo de grandes volúmenes de datos.

## Recursos adicionales

- **Presentación PowerPoint**: Una presentación con los puntos clave del diseño y modelado de bases de datos.
- **Diagramas ER**: Ejemplo de diagramas de entidad-relación para una base de datos de almacén.

# Ejemplos de Diseño y Modelado de Bases de Datos

Este archivo README contiene ejemplos de SQL para la creación de tablas y relaciones entre ellas en el contexto de un sistema de gestión de almacén. Se abordan tanto el diseño conceptual como el lógico, incluyendo las relaciones clave y la integridad referencial.

## Ejemplo de creación de tablas

### 1. Tabla `Productos`

```sql
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);
```

### 2. Tabla `Proveedores`

```sql
CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(255) NOT NULL,
    contacto VARCHAR(255),
    telefono VARCHAR(50),
    direccion VARCHAR(255)
);
```

### 3. Tabla `Clientes`

```sql
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL,
    correo_cliente VARCHAR(255),
    telefono_cliente VARCHAR(50),
    direccion_cliente VARCHAR(255)
);
```

## Ejemplo de relaciones entre tablas

### 1. Relación entre `Ventas` y `Clientes`

```sql
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_venta DATE,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
```

### 2. Relación entre `Ordenes_Compra` y `Proveedores`

```sql
CREATE TABLE Ordenes_Compra (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    fecha_orden DATE,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);
```

## Ejemplo de normalización

El proceso de normalización ayuda a evitar la redundancia y asegura la integridad de los datos.

### Normalización a 3FN:

1. **Primera Forma Normal (1FN)**: Asegura que los datos estén en forma tabular y cada columna contenga valores atómicos.
2. **Segunda Forma Normal (2FN)**: Asegura que no haya dependencia parcial de la clave primaria.
3. **Tercera Forma Normal (3FN)**: Elimina dependencias transitivas.

Ejemplo:

```sql
-- Datos sobre clientes normalizados en dos tablas para evitar redundancia.

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL,
    correo_cliente VARCHAR(255),
    telefono_cliente VARCHAR(50)
);

CREATE TABLE Direcciones_Cliente (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    direccion VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
```

## Escalabilidad y Rendimiento

Para optimizar consultas y mejorar el rendimiento en bases de datos de gran tamaño, se pueden utilizar índices:

```sql
CREATE INDEX idx_nombre_producto ON Productos(nombre_producto);
```


