# Índices y Optimización de Consultas

Los **índices** son estructuras de datos que mejoran la velocidad de las operaciones de búsqueda en una tabla, a costa de un poco de espacio adicional y tiempo de escritura.

---

## 1. ¿Por qué usar índices?
Sin un índice, PostgreSQL debe recorrer toda la tabla (Sequential Scan) para encontrar una fila. Con un índice, puede ir directamente a la ubicación del dato (Index Scan).

---

## 2. Tipos de Índices en PostgreSQL

| Tipo | Descripción | Uso común |
| :--- | :--- | :--- |
| **B-Tree** | El predeterminado. Organiza datos de forma equilibrada. | Comparaciones (`=`, `>`, `<`), ordenamiento (`ORDER BY`). |
| **Hash** | Solo para comparaciones de igualdad. | Búsquedas exactas (`=`). |
| **GIN** | Generalized Inverted Index. | Para datos complejos como `JSONB`, `Arrays` o búsqueda de texto. |
| **GiST** | Generalized Search Tree. | Datos geométricos o rangos. |

---

## 3. Crear y Eliminar Índices

### Índice simple
```sql
CREATE INDEX idx_usuarios_email ON usuarios(email);
```

### Índice compuesto (varias columnas)
Útil cuando las consultas suelen filtrar por ambas columnas a la vez.
```sql
CREATE INDEX idx_pedidos_cliente_fecha ON pedidos(usuario_id, fecha);
```

### Índice único (Unique Index)
Asegura que los valores sean distintos (se crea automáticamente con `PRIMARY KEY` y `UNIQUE`).
```sql
CREATE UNIQUE INDEX idx_dni_unico ON personas(dni);
```

### Eliminar índice
```sql
DROP INDEX idx_usuarios_email;
```

---

## 4. Analizar el Rendimiento (EXPLAIN)
La herramienta más potente para saber si una consulta es lenta y por qué.

- `EXPLAIN`: Muestra el plan de ejecución estimado.
- `EXPLAIN ANALYZE`: Ejecuta la consulta y muestra el tiempo real.

```sql
EXPLAIN ANALYZE 
SELECT * FROM pedidos 
WHERE monto > 1000;
```

### Métodos de Acceso (¿Cómo encuentra los datos?)
Cuando ejecutas `EXPLAIN`, PostgreSQL te dirá qué "método" eligió el optimizador. Estos son los más comunes:

1. **Sequential Scan (Seq Scan)**:
   - **Qué es**: Recorre todas las filas de la tabla una por una.
   - **Cuándo ocurre**: Si no hay un índice, si la tabla es muy pequeña, o si la consulta pide un porcentaje muy alto de los datos de la tabla (más del 20-30%).

2. **Index Scan**:
   - **Qué es**: Busca primero en el índice para obtener la ubicación física de las filas y luego va a la tabla a buscar el resto de los datos.
   - **Cuándo ocurre**: Cuando filtras por una columna indexada y la tabla es lo suficientemente grande para que no convenga el Seq Scan.

3. **Index Only Scan**:
   - **Qué es**: El método más rápido. Obtiene todos los datos que necesita **directamente del índice**, sin tener que ir a la tabla física.
   - **Cuándo ocurre**: Cuando todas las columnas pedidas en el `SELECT` están incluidas en el índice.

4. **Bitmap Index Scan**:
   - **Qué es**: Crea un "mapa de bits" en memoria con las posiciones de las filas que coinciden en el índice. Es una técnica intermedia muy eficiente para manejar muchas filas.
   - **Cuándo ocurre**: Cuando se combinan varios índices o cuando hay que leer muchas filas dispersas por la tabla.

---

## 5. Buenas Prácticas
1. **No indexar todo**: Cada índice ralentiza los `INSERT`, `UPDATE` y `DELETE`.
2. **Columnas frecuentes**: Indexar columnas usadas en `WHERE`, `JOIN` y `ORDER BY`.
3. **Cardinalidad**: Indexar columnas con muchos valores distintos (ej. email) es más efectivo que indexar columnas con pocos valores (ej. género).
4. **Mantenimiento**: Usa `VACUUM` y `ANALYZE` regularmente para que el optimizador tenga estadísticas frescas.
