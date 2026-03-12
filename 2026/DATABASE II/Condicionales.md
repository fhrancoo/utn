# Condicionales en PostgreSQL

En PostgreSQL, existen dos formas principales de aplicar condicionales: directamente en consultas SQL (expresiones) o dentro de bloques procedimentales PL/pgSQL (estructuras de control).

---

## 1. Condicionales en Consultas SQL (Expresiones)

Estas se pueden usar dentro de un `SELECT`, `UPDATE` o `WHERE`.

### CASE (Expresión)
Es el estándar de SQL para lógica de "si/entonces".

```sql
SELECT nombre, precio,
  CASE 
    WHEN precio > 1000 THEN 'Caro'
    WHEN precio BETWEEN 500 AND 1000 THEN 'Medio'
    ELSE 'Barato'
  END AS categoria_precio
FROM productos;
```

### COALESCE
Devuelve el primer valor no nulo de una lista. Muy útil para mostrar valores por defecto.

```sql
-- Si el teléfono es NULL, muestra 'No tiene'
SELECT nombre, COALESCE(telefono, 'No tiene') FROM usuarios;
```

### NULLIF
Devuelve `NULL` si los dos parámetros son iguales, de lo contrario devuelve el primero. Se usa frecuentemente para evitar divisiones por cero.

```sql
-- Evita error de división por cero devolviendo NULL en lugar de error
SELECT 100 / NULLIF(divisor, 0) FROM tabla;
```

### GREATEST y LEAST
Seleccionan el valor máximo o mínimo de una lista de expresiones.

```sql
SELECT nombre, GREATEST(precio_lista, precio_oferta) FROM productos;
```

---

## 2. Condicionales en Programación (PL/pgSQL)

Estas estructuras solo funcionan dentro de funciones, procedimientos o bloques anónimos (`DO $$ ... $$`).

### Estructura IF
Permite ejecutar bloques de código basados en condiciones booleanas.

```sql
IF condicion THEN
    -- bloque si es verdadero
ELSIF otra_condicion THEN
    -- bloque si la otra condición es verdadera
ELSE
    -- bloque si ninguna es verdadera
END IF;
```

### CASE (Sentencia Procedimental)
A diferencia de la expresión CASE, esta se usa para controlar el flujo de ejecución.

```sql
CASE variable
    WHEN valor1 THEN
        -- lógica para valor1
    WHEN valor2 THEN
        -- lógica para valor2
    ELSE
        -- lógica por defecto
END CASE;
```

**Ejemplo en una función:**
```sql
CREATE OR REPLACE FUNCTION nivel_acceso(rol TEXT)
RETURNS TEXT AS $$
BEGIN
    IF rol = 'admin' THEN
        RETURN 'Acceso Total';
    ELSIF rol = 'editor' THEN
        RETURN 'Acceso Parcial';
    ELSE
        RETURN 'Sin Acceso';
    END IF;
END;
$$ LANGUAGE plpgsql;
```
