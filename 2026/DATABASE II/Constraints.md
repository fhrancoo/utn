# Restricciones e Integridad de Datos (Constraints)

Las **restricciones (Constraints)** son reglas aplicadas a las columnas de una tabla para asegurar que los datos sean correctos y confiables (integridad).

---

## 1. Restricciones Comunes
PostgreSQL ofrece varias formas de validar datos antes de que entren en la base de datos.

| Restricción | Descripción |
| :--- | :--- |
| `NOT NULL` | Impide que una columna tenga valores nulos. |
| `UNIQUE` | Asegura que todos los valores en una columna sean distintos. |
| `PRIMARY KEY` | Combina `NOT NULL` y `UNIQUE`. Identifica cada fila de forma única. |
| `FOREIGN KEY` | Mantiene la relación entre dos tablas (integridad referencial). |
| `CHECK` | Valida que los valores cumplan una condición específica. |
| `DEFAULT` | Asigna un valor predefinido si no se proporciona uno. |

---

## 2. CHECK Constraints
Permiten definir reglas de negocio directamente en la tabla.

```sql
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio NUMERIC(10, 2) CHECK (precio > 0), -- El precio debe ser mayor a 0
    stock INTEGER CHECK (stock >= 0),        -- El stock no puede ser negativo
    descuento NUMERIC CHECK (descuento < precio) -- Regla entre dos columnas
);
```

---

## 3. Integridad Referencial (FOREIGN KEY)
Asegura que los datos en una tabla correspondan con los de otra.

### Acciones en Cascada
Define qué pasa si se borra o actualiza el registro padre.

| Acción | Descripción |
| :--- | :--- |
| `ON DELETE CASCADE` | Si se borra el padre, se borran automáticamente los hijos. |
| `ON DELETE SET NULL` | Si se borra el padre, los hijos quedan con el valor `NULL`. |
| `ON DELETE RESTRICT` | Impide borrar el padre si tiene hijos (valor por defecto). |

**Ejemplo:**
```sql
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id) ON DELETE CASCADE,
    monto NUMERIC(10, 2)
);
```

---

## 4. Modificar Restricciones (ALTER)
Se pueden añadir o borrar reglas después de crear la tabla.

```sql
-- Añadir una restricción UNIQUE
ALTER TABLE usuarios ADD CONSTRAINT email_unico UNIQUE (email);

-- Añadir una regla CHECK
ALTER TABLE usuarios ADD CONSTRAINT edad_minima CHECK (edad >= 18);

-- Eliminar una restricción
ALTER TABLE usuarios DROP CONSTRAINT email_unico;
```
