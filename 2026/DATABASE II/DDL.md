# Lenguaje de Definición de Datos (DDL - Data Definition Language)

El **Lenguaje de Definición de Datos (DDL - Data Definition Language)** es la parte de SQL que se utiliza para definir, modificar y gestionar la estructura de los objetos en la base de datos (tablas, índices, vistas, esquemas, etc.). A diferencia del DML, el DDL no manipula los datos en sí, sino el "contenedor" donde residen.

---

## 1. CREATE (Crear objetos)
Se utiliza para crear nuevos objetos como tablas, bases de datos o tipos.

### Sintaxis básica (Tablas)
```sql
CREATE TABLE nombre_tabla (
    columna1 tipo_dato restricciones,
    columna2 tipo_dato restricciones,
    ...
);
```

### Ejemplos
**Crear una tabla con restricciones:**
```sql
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Crear una tabla con clave foránea:**
```sql
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    monto NUMERIC(10, 2),
    fecha DATE
);
```

---

## 2. ALTER (Modificar objetos)
Se utiliza para modificar la estructura de un objeto existente (añadir, borrar o cambiar columnas).

### Sintaxis
```sql
ALTER TABLE nombre_tabla ACCION;
```

### Ejemplos
**Añadir una columna:**
```sql
ALTER TABLE usuarios ADD COLUMN telefono VARCHAR(15);
```

**Cambiar el tipo de dato de una columna:**
```sql
ALTER TABLE usuarios ALTER COLUMN username TYPE VARCHAR(100);
```

**Eliminar una columna:**
```sql
ALTER TABLE usuarios DROP COLUMN fecha_registro;
```

---

## 3. DROP (Eliminar objetos)
Elimina permanentemente un objeto de la base de datos (estructura y datos incluidos).

### Sintaxis
```sql
DROP TABLE nombre_tabla;
```

### Ejemplos
**Eliminar una tabla:**
```sql
DROP TABLE pedidos;
```

**Eliminar una tabla solo si existe (Recomendado):**
```sql
DROP TABLE IF EXISTS productos;
```

---

## 4. TRUNCATE (Vaciar tablas)
Elimina todos los datos de una tabla de forma rápida, pero mantiene su estructura intacta.

### Sintaxis
```sql
TRUNCATE TABLE nombre_tabla;
```

### Ejemplos
**Vaciar una tabla completamente:**
```sql
TRUNCATE TABLE logs;
```

**Vaciar y reiniciar contadores (SERIAL/IDENTITY):**
```sql
TRUNCATE TABLE usuarios RESTART IDENTITY;
```

---

## Resumen de Comandos DDL

| Comando | Acción |
| :--- | :--- |
| `CREATE` | Crea un nuevo objeto (tabla, índice, etc.). |
| `ALTER` | Modifica la estructura de un objeto existente. |
| `DROP` | Elimina un objeto de forma permanente. |
| `TRUNCATE` | Elimina todos los registros de una tabla pero mantiene la estructura. |
| `RENAME` | Cambia el nombre de un objeto. |
