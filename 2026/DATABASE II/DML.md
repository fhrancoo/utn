# Lenguaje de Manipulación de Datos (DML - Data Manipulation Language)

El **Lenguaje de Manipulación de Datos (DML - Data Manipulation Language)** es una parte de SQL que se utiliza para gestionar y manipular los datos dentro de las tablas de una base de datos. A diferencia del DDL (Data Definition Language), que se ocupa de la estructura, el DML se centra en el contenido.

En PostgreSQL, los comandos DML principales son `INSERT`, `UPDATE` y `DELETE`. Para la recuperación de datos (lectura), consulta el archivo especializado en [DQL.md](DQL.md).

---

## 1. INSERT (Insertar datos)
Se utiliza para añadir nuevas filas a una tabla.

### Sintaxis
```sql
INSERT INTO nombre_tabla (columna1, columna2, ...)
VALUES (valor1, valor2, ...);
```

### Ejemplos
**Insertar una sola fila:**
```sql
INSERT INTO usuarios (nombre, email, edad)
VALUES ('Juan Pérez', 'juan@example.com', 25);
```

**Insertar múltiples filas (Eficiente):**
```sql
INSERT INTO usuarios (nombre, email)
VALUES 
    ('Ana García', 'ana@example.com'),
    ('Luis López', 'luis@example.com');
```

**Insertar con RETURNING (PostgreSQL extension):**
```sql
INSERT INTO usuarios (nombre, email)
VALUES ('Maria Solo', 'maria@example.com')
RETURNING id; -- Devuelve el ID generado automáticamente
```

---

## 2. UPDATE (Actualizar datos)
Modifica los valores de las filas existentes que cumplen con una condición.

### Sintaxis
```sql
UPDATE nombre_tabla
SET columna1 = nuevo_valor1, columna2 = nuevo_valor2
WHERE condicion;
```
> **IMPORTANTE:** Siempre usa una cláusula `WHERE`. Si la omites, se actualizarán **todas** las filas de la tabla.

### Ejemplos
**Actualizar un registro específico:**
```sql
UPDATE usuarios
SET email = 'juan.nuevo@example.com', edad = 26
WHERE id = 1;
```

**Actualizar múltiples filas basado en una condición:**
```sql
UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Electrónica';
```

---

## 3. DELETE (Eliminar datos)
Elimina filas de una tabla según una condición.

### Sintaxis
```sql
DELETE FROM nombre_tabla
WHERE condicion;
```
> **IMPORTANTE:** Al igual que con `UPDATE`, si omites el `WHERE`, se borrarán **todos** los registros de la tabla.

### Ejemplos
**Eliminar un registro específico:**
```sql
DELETE FROM usuarios
WHERE id = 5;
```

**Eliminar registros que cumplen una condición:**
```sql
DELETE FROM sesiones
WHERE fecha_expiracion < NOW();
```

---

## Resumen de Comandos DML

| Comando | Acción |
| :--- | :--- |
| `INSERT` | Crea nuevos registros. |
| `UPDATE` | Modifica registros existentes. |
| `DELETE` | Elimina registros existentes. |

