# Optimización con `EXPLAIN ANALYZE` en PostgreSQL

Asegurarnos de que nuestras consultas sean eficientes es clave para que nuestra aplicación no sea lenta. La herramienta más poderosa para esto es `EXPLAIN ANALYZE`.

## 1. El Comando `EXPLAIN` vs `EXPLAIN ANALYZE`

- `EXPLAIN`: Muestra el plan de ejecución estimado por el optimizador de PostgreSQL.
- `EXPLAIN ANALYZE`: Ejecuta la consulta real y muestra el tiempo de ejecución de cada paso.

```sql
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'test@example.com';
```

## 2. Qué buscar en la Salida

- `Seq Scan`: Escaneo secuencial (lento en tablas grandes). Significa que PostgreSQL revisó fila por fila.
- `Index Scan`: Escaneo por índice (rápido). PostgreSQL usó un índice para encontrar la fila directamente.
- `Cost`: Una unidad de medida del costo estimado.
- `Actual Time`: El tiempo real que tomó cada paso.

## 3. Ejemplo de Optimización

Si vemos un `Seq Scan` en una columna que consultamos frecuentemente:

```sql
-- Antes del índice (Seq Scan)
EXPLAIN ANALYZE SELECT * FROM orders WHERE customer_id = 42;

-- Creamos el índice
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Después del índice (Index Scan)
EXPLAIN ANALYZE SELECT * FROM orders WHERE customer_id = 42;
```

## 4. Índices Compuestos y Parciales

Podemos crear índices específicos para mejorar aún más el rendimiento:

```sql
-- Índice Compuesto (Para consultas con múltiples columnas)
CREATE INDEX idx_users_name_email ON users(name, email);

-- Índice Parcial (Solo indexa filas que cumplen una condición)
CREATE INDEX idx_active_users ON users(id) WHERE status = 'active';
```

## 5. El Problema de los Índices

¡No indexen todo! Los índices:
- Ocupan espacio en disco.
- Ralentizan las operaciones de escritura (`INSERT`, `UPDATE`, `DELETE`) porque el índice debe actualizarse.

---
**Nota para los alumnos:** Siempre prueben sus consultas con datos reales antes de subir a producción. Lo que funciona rápido en una tabla con 10 filas puede ser un desastre en una con 10 millones.
