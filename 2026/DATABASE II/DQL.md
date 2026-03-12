# Consultas Avanzadas (DQL - Data Query Language)

El **Lenguaje de Consulta de Datos (DQL - Data Query Language)** se utiliza para recuperar datos de la base de datos de forma flexible y potente.

---

## 1. SELECT Básico y DISTINCT
Se usa para elegir columnas y eliminar duplicados.

- `SELECT *`: Selecciona todas las columnas.
- `SELECT DISTINCT`: Devuelve solo valores únicos de una columna o combinación de columnas.

```sql
-- Seleccionar nombres únicos de ciudades
SELECT DISTINCT ciudad FROM usuarios;
```

---

## 2. JOINS (Uniones de tablas)
Permiten combinar registros de dos o más tablas basados en una relación entre ellas.

### INNER JOIN (o simplemente JOIN)
Devuelve registros que tienen valores coincidentes en ambas tablas.
```sql
SELECT u.nombre, p.monto
FROM usuarios u
INNER JOIN pedidos p ON u.id = p.usuario_id;
```

### LEFT JOIN (o LEFT OUTER JOIN)
Devuelve todos los registros de la tabla izquierda y los coincidentes de la derecha. Si no hay coincidencia, devuelve `NULL`.
```sql
SELECT u.nombre, p.monto
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.usuario_id;
```

### RIGHT JOIN (o RIGHT OUTER JOIN)
Inverso al LEFT JOIN: devuelve todos los registros de la tabla derecha.
```sql
SELECT u.nombre, p.monto
FROM usuarios u
RIGHT JOIN pedidos p ON u.id = p.usuario_id;
```

### FULL OUTER JOIN
Devuelve registros cuando hay una coincidencia en cualquiera de las tablas (combina LEFT y RIGHT).
```sql
SELECT u.nombre, p.monto
FROM usuarios u
FULL OUTER JOIN pedidos p ON u.id = p.usuario_id;
```

### CROSS JOIN (Producto Cartesiano)
Combina cada fila de la primera tabla con cada fila de la segunda.
```sql
SELECT u.nombre, p.nombre_producto
FROM usuarios u
CROSS JOIN productos p;
```

---

## 3. Agregación y Agrupamiento
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

## 5. Subconsultas y Operadores de Comparación de Subconsultas
Consultas anidadas dentro de otra consulta.

### Subconsultas Escalares
Devuelven un único valor.
```sql
SELECT nombre, precio
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos); -- Productos por encima del promedio
```

### EXISTS / NOT EXISTS
Verifica si la subconsulta devuelve al menos una fila. Es muy eficiente para comprobaciones de existencia.
```sql
-- Usuarios que han realizado al menos un pedido
SELECT nombre 
FROM usuarios u
WHERE EXISTS (SELECT 1 FROM pedidos p WHERE p.usuario_id = u.id);
```

### ANY / ALL
Compara un valor contra un conjunto de valores devueltos por una subconsulta.
- `ANY`: Se cumple si la condición es verdadera para al menos un elemento.
- `ALL`: Se cumple si la condición es verdadera para todos los elementos.

```sql
-- Productos más caros que CUALQUIER producto de la categoría 'Libros'
SELECT nombre FROM productos WHERE precio > ANY (SELECT precio FROM productos WHERE categoria = 'Libros');
```

> **Nota:** Para más detalles sobre operadores de filtrado (LIKE, BETWEEN, IN, etc.), consulta [Operadores.md](Operadores.md).

---

## 6. Operadores de Conjunto
Combinan los resultados de dos consultas `SELECT`.

- `UNION`: Combina y elimina duplicados.
- `UNION ALL`: Combina manteniendo duplicados (más rápido).
- `INTERSECT`: Devuelve solo lo que aparece en ambas.
- `EXCEPT`: Devuelve lo que está en la primera pero no en la segunda.

---

## 7. Ordenamiento y Límites (ORDER BY y LIMIT)

Para organizar los resultados finales de una consulta.

- **ORDER BY**: Ordena los resultados (`ASC` para ascendente, `DESC` para descendente).
- **LIMIT**: Limita la cantidad de filas devueltas.
- **OFFSET**: Salta una cantidad de filas (útil para paginación).

**Ejemplo:**
```sql
-- Los 5 productos más caros
SELECT * FROM productos 
ORDER BY precio DESC 
LIMIT 5;

-- Paginación: saltar los primeros 10 y mostrar los siguientes 10
SELECT * FROM productos 
ORDER BY id 
LIMIT 10 OFFSET 10;
```

---

## Estructura Completa de una Consulta SELECT

El orden de las cláusulas en SQL es estricto:

1. `SELECT` (columnas)
2. `FROM` (tabla principal)
3. `JOIN` (uniones)
4. `WHERE` (filtros de filas)
5. `GROUP BY` (agrupamiento)
6. `HAVING` (filtros de grupos)
7. `ORDER BY` (ordenamiento)
8. `LIMIT` / `OFFSET` (recorte)

