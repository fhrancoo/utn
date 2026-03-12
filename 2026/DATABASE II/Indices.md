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

---

## 5. Buenas Prácticas
1. **No indexar todo**: Cada índice ralentiza los `INSERT`, `UPDATE` y `DELETE`.
2. **Columnas frecuentes**: Indexar columnas usadas en `WHERE`, `JOIN` y `ORDER BY`.
3. **Cardinalidad**: Indexar columnas con muchos valores distintos (ej. email) es más efectivo que indexar columnas con pocos valores (ej. género).
4. **Mantenimiento**: Usa `VACUUM` y `ANALYZE` regularmente para que el optimizador tenga estadísticas frescas.
