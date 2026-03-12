# Operadores y Filtrado en PostgreSQL

Para extraer información específica de una base de datos, utilizamos la cláusula `WHERE` junto con diversos operadores.

---

## 1. Cláusula WHERE y Operadores de Comparación

Se utiliza para filtrar registros que cumplen una condición determinada.

| Operador | Descripción | Ejemplo |
| :--- | :--- | :--- |
| `=` | Igual a | `WHERE edad = 25` |
| `<>` o `!=` | Distinto de | `WHERE ciudad <> 'Buenos Aires'` |
| `<` | Menor que | `WHERE precio < 100` |
| `>` | Mayor que | `WHERE stock > 0` |
| `<=` | Menor o igual | `WHERE nota <= 4` |
| `>=` | Mayor o igual | `WHERE salario >= 50000` |

---

## 2. Operadores Lógicos

Permiten combinar múltiples condiciones en una sola consulta.

- **AND**: Todas las condiciones deben ser verdaderas.
- **OR**: Al menos una condición debe ser verdadera.
- **NOT**: Invierte el valor de la condición.

**Ejemplo:**
```sql
SELECT * FROM usuarios 
WHERE edad > 18 AND ciudad = 'Córdoba';

SELECT * FROM productos 
WHERE categoria = 'Electrónica' OR precio < 500;
```

---

## 3. Operadores de Patrón (LIKE e ILIKE)

Se utilizan para buscar coincidencias parciales en cadenas de texto.

- `%`: Representa cualquier número de caracteres (incluyendo cero).
- `_`: Representa exactamente un carácter.
- **LIKE**: Sensible a mayúsculas y minúsculas.
- **ILIKE**: Insensible a mayúsculas y minúsculas (Extensión de PostgreSQL).

**Ejemplos:**
```sql
-- Usuarios cuyo nombre empieza con 'A'
SELECT * FROM usuarios WHERE nombre LIKE 'A%';

-- Usuarios cuyo nombre termina con 'z'
SELECT * FROM usuarios WHERE nombre LIKE '%z';

-- Usuarios que contienen 'juan' en cualquier parte (sin importar mayúsculas)
SELECT * FROM usuarios WHERE nombre ILIKE '%juan%';

-- Usuarios con un nombre de 4 letras que empieza con 'J'
SELECT * FROM usuarios WHERE nombre LIKE 'J___';
```

---

## 4. Operadores de Rango y Lista (BETWEEN e IN)

- **BETWEEN**: Filtra valores dentro de un rango inclusivo.
- **IN**: Filtra valores que coinciden con cualquier elemento de una lista.

**Ejemplos:**
```sql
-- Precios entre 100 y 500
SELECT * FROM productos WHERE precio BETWEEN 100 AND 500;

-- Usuarios de ciudades específicas
SELECT * FROM usuarios WHERE ciudad IN ('Córdoba', 'Rosario', 'Mendoza');
```

---

## 5. Manejo de Nulos (IS NULL)

Los valores nulos no se pueden comparar con `=`, se debe usar `IS NULL` o `IS NOT NULL`.

```sql
-- Usuarios que no tienen teléfono cargado
SELECT * FROM usuarios WHERE telefono IS NULL;

-- Usuarios que sí tienen email cargado
SELECT * FROM usuarios WHERE email IS NOT NULL;
```

---

## 6. Agrupamiento y Filtrado de Grupos (GROUP BY y HAVING)

- **GROUP BY**: Agrupa filas que tienen los mismos valores en columnas específicas.
- **HAVING**: Es como el `WHERE`, pero se aplica a los grupos generados por `GROUP BY`.

**Ejemplo:**
```sql
-- Contar cuántos usuarios hay por cada ciudad
SELECT ciudad, COUNT(*) as total_usuarios
FROM usuarios
GROUP BY ciudad;

-- Mostrar ciudades con más de 10 usuarios
SELECT ciudad, COUNT(*) as total_usuarios
FROM usuarios
GROUP BY ciudad
HAVING COUNT(*) > 10;
```

---

## 7. Ordenamiento y Límites (ORDER BY y LIMIT)

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
