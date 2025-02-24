# Introducción a SQL Server y sus Tipos de Datos

SQL Server es un sistema de gestión de bases de datos relacionales (RDBMS) desarrollado por Microsoft. Se utiliza para almacenar, administrar y recuperar datos de manera eficiente. Funciona bajo el lenguaje SQL (Structured Query Language) y permite la manipulación de datos a través de consultas estructuradas.

### Tipos de Datos en SQL Server
SQL Server ofrece diversos tipos de datos, los cuales se pueden clasificar en varias categorías:

#### 1. Tipos de Datos Numéricos
- **INT**: Almacena números enteros de 4 bytes (-2,147,483,648 a 2,147,483,647).
- **BIGINT**: Almacena números enteros de 8 bytes.
- **SMALLINT**: Almacena números enteros pequeños de 2 bytes.
- **TINYINT**: Almacena números enteros de 1 byte (0 a 255).
- **DECIMAL(p, s) / NUMERIC(p, s)**: Almacena números decimales con precisión y escala definida.
- **FLOAT**: Almacena números de coma flotante de precisión variable.
- **REAL**: Similar a FLOAT pero con menor precisión.

*Ejemplo:*
```sql
CREATE TABLE Productos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10,2)
);
```

#### 2. Tipos de Datos de Caracteres
- **CHAR(n)**: Almacena cadenas de longitud fija de n caracteres.
- **VARCHAR(n)**: Almacena cadenas de longitud variable hasta n caracteres.
- **TEXT**: Almacena grandes volúmenes de texto (obsoleto, usar VARCHAR(MAX)).

*Ejemplo:*
```sql
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion TEXT
);
```

#### 3. Tipos de Datos de Fecha y Hora
- **DATE**: Almacena solo la fecha.
- **TIME**: Almacena solo la hora.
- **DATETIME**: Almacena fecha y hora completa.
- **SMALLDATETIME**: Similar a DATETIME pero con menor precisión.
- **DATETIME2**: Versión mejorada de DATETIME.
- **DATETIMEOFFSET**: Incluye zona horaria.

*Ejemplo:*
```sql
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    ClienteID INT,
    FechaPedido DATETIME
);
```

#### 4. Tipos de Datos Lógicos
- **BIT**: Almacena valores 0 o 1 (falso o verdadero).

*Ejemplo:*
```sql
CREATE TABLE Empleados (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Activo BIT
);
```

#### 5. Tipos de Datos Binarios
- **BINARY(n)**: Almacena datos binarios de longitud fija.
- **VARBINARY(n) / VARBINARY(MAX)**: Almacena datos binarios de longitud variable.

*Ejemplo:*
```sql
CREATE TABLE Documentos (
    ID INT PRIMARY KEY,
    Archivo VARBINARY(MAX)
);
```

#### 6. Tipos de Datos Especiales
- **UNIQUEIDENTIFIER**: Almacena identificadores únicos globales (GUIDs).
- **XML**: Almacena datos en formato XML.
- **GEOMETRY / GEOGRAPHY**: Almacenan datos espaciales.

*Ejemplo:*
```sql
CREATE TABLE Usuarios (
    ID UNIQUEIDENTIFIER DEFAULT NEWID(),
    Nombre VARCHAR(50)
);
```

SQL Server 2022 tiene varias ediciones, y algunas son gratuitas mientras que otras requieren licencia de pago.

Aquí tienes una tabla comparativa de las ediciones de SQL Server 2022:  

| Característica              | Express (Gratis) | Developer (Gratis) | Standard (Pago) | Enterprise (Pago) |
|----------------------------|----------------|------------------|----------------|----------------|
| **Uso permitido**          | Producción pequeña | Solo desarrollo/pruebas | Producción | Producción |
| **Límite de tamaño BD**    | 10 GB          | Ilimitado       | Ilimitado      | Ilimitado |
| **Memoria máxima usada**   | 1 GB           | Ilimitado       | 128 GB        | Ilimitado |
| **Núcleos CPU usados**     | 1 núcleo       | Ilimitado       | 24 núcleos    | Ilimitado |
| **Alta disponibilidad**    | ❌ No          | ❌ No           | ✅ Sí         | ✅ Sí |
| **Replication**            | Solo suscriptor | Completa        | Completa      | Completa |
| **Funciones avanzadas**    | ❌ No          | ✅ Sí           | ✅ Algunas    | ✅ Todas |
| **Soporte oficial**        | Básico         | No aplicable    | Completo      | Completo |

Si solo necesitas practicar y aprender, **Developer** es la mejor opción. Si buscas algo gratuito para producción, **Express** puede servir, pero con muchas limitaciones. Para aplicaciones más exigentes, necesitarás una edición **Standard o Enterprise**.

### Conclusión
SQL Server ofrece una amplia gama de tipos de datos que permiten manejar información de manera eficiente. Es importante elegir el tipo adecuado según las necesidades de almacenamiento y procesamiento de datos. Con esta base, los alumnos podrán diseñar bases de datos optimizadas y funcionales.

