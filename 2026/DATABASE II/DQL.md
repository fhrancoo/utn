# Consultas Avanzadas (DQL - Data Query Language)

El **Lenguaje de Consulta de Datos (DQL - Data Query Language)** se utiliza para recuperar datos de la base de datos de forma flexible y potente.

---

## 1. JOINS (Uniones de tablas)
Permiten combinar registros de dos o más tablas basados en una relación entre ellas.

### INNER JOIN
Devuelve registros que tienen valores coincidentes en ambas tablas.
```sql
SELECT u.nombre, p.monto
FROM usuarios u
INNER JOIN pedidos p ON u.id = p.usuario_id;
```

### LEFT JOIN (u OUTER JOIN)
Devuelve todos los registros de la tabla izquierda y los coincidentes de la derecha. Si no hay coincidencia, devuelve `NULL`.
```sql
SELECT u.nombre, p.monto
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.usuario_id;
```

---

## 2. Agregación y Agrupamiento
Se usan para realizar cálculos sobre un conjunto de valores.

| Función | Descripción |
| :--- | :--- |
| `COUNT()` | Cuenta el número de filas. |
| `SUM()` | Suma los valores de una columna. |
| `AVG()` | Calcula el promedio. |
| `MAX()` / `MIN()` | Encuentra el valor máximo o mínimo. |

**Ejemplo con GROUP BY y HAVING:**
```sql
SELECT categoria, COUNT(*), AVG(precio)
FROM productos
GROUP BY categoria
HAVING COUNT(*) > 5; -- Solo categorías con más de 5 productos
```

---

## 3. CTEs (Common Table Expressions)
Permiten crear "tablas temporales" para hacer consultas más legibles usando la cláusula `WITH`.

```sql
WITH pedidos_recientes AS (
    SELECT usuario_id, SUM(monto) as total
    FROM pedidos
    WHERE fecha > '2024-01-01'
    GROUP BY usuario_id
)
SELECT u.nombre, pr.total
FROM usuarios u
JOIN pedidos_recientes pr ON u.id = pr.usuario_id;
```

---

## 4. Subconsultas
Consultas anidadas dentro de otra consulta.

```sql
SELECT nombre, precio
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos); -- Productos por encima del promedio
```

---

## 5. Operadores de Conjunto
Combinan los resultados de dos consultas `SELECT`.

- `UNION`: Combina y elimina duplicados.
- `UNION ALL`: Combina manteniendo duplicados (más rápido).
- `INTERSECT`: Devuelve solo lo que aparece en ambas.
- `EXCEPT`: Devuelve lo que está en la primera pero no en la segunda.
