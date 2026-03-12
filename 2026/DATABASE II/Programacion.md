# Programación en la Base de Datos (PL/pgSQL)

PostgreSQL permite escribir lógica compleja directamente en la base de datos usando **PL/pgSQL** (un lenguaje procedimental similar a SQL).

> **Nota para pgAdmin:** Todos estos ejemplos se pueden ejecutar en el **Query Tool**. Asegúrate de seleccionar el bloque completo (desde `CREATE` hasta `LANGUAGE plpgsql;`) antes de presionar **F5**.

---

## 1. Funciones
Se usan para encapsular lógica reutilizable que devuelve un valor.

### Sintaxis básica
```sql
CREATE OR REPLACE FUNCTION nombre_funcion(parametro1 tipo, ...)
RETURNS tipo_retorno AS $$
BEGIN
    -- Lógica de la función
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;
```

### Ejemplo: Función para calcular el IVA
```sql
CREATE OR REPLACE FUNCTION calcular_iva(monto NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN monto * 0.21;
END;
$$ LANGUAGE plpgsql;

-- Uso:
SELECT nombre, calcular_iva(precio) FROM productos;
```

---

## 2. Procedimientos Almacenados
A diferencia de las funciones, los procedimientos **no devuelven valores** (pueden usar parámetros `INOUT`) y **permiten gestionar transacciones** (`COMMIT`/`ROLLBACK`) internamente.

```sql
CREATE OR REPLACE PROCEDURE realizar_transferencia(id_origen INT, id_destino INT, monto NUMERIC)
AS $$
BEGIN
    UPDATE cuentas SET saldo = saldo - monto WHERE id = id_origen;
    UPDATE cuentas SET saldo = saldo + monto WHERE id = id_destino;
    COMMIT;
END;
$$ LANGUAGE plpgsql;

-- Uso:
CALL realizar_transferencia(1, 2, 100);
```

---

## 3. Triggers (Disparadores)
Son funciones que se ejecutan automáticamente cuando ocurre un evento (`INSERT`, `UPDATE` o `DELETE`) en una tabla.

### Paso 1: Crear la función del Trigger
```sql
CREATE OR REPLACE FUNCTION log_cambio_precio()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.precio <> OLD.precio THEN
        INSERT INTO auditoria_precios (producto_id, precio_anterior, precio_nuevo, fecha)
        VALUES (OLD.id, OLD.precio, NEW.precio, NOW());
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

### Paso 2: Crear el Trigger en la tabla
```sql
CREATE TRIGGER trigger_auditoria_precio
AFTER UPDATE ON productos
FOR EACH ROW
EXECUTE FUNCTION log_cambio_precio();
```

---

## 4. Estructuras de Control y Lógica (Separado)

Para una explicación detallada sobre cómo manejar el flujo de ejecución (IF, CASE, Bucles, Mensajes), consulta los siguientes archivos:

- [Condicionales.md](Condicionales.md)
- [Bucles-Control.md](Bucles-Control.md)

---

## 5. Lenguajes Soportados (LANGUAGE)

PostgreSQL es altamente extensible y permite escribir funciones en varios lenguajes. El parámetro `LANGUAGE` al final de la definición indica cuál se está usando.

| Lenguaje | Descripción | Uso común |
| :--- | :--- | :--- |
| **plpgsql** | El lenguaje procedimental estándar de Postgres. | Lógica de negocio, triggers y manipulación de datos SQL. |
| **sql** | Funciones puras de SQL (sin lógica de control como IF/LOOP). | Consultas simples o "macros" rápidas. Muy eficiente. |
| **c** | Funciones escritas en C y compiladas como librerías. | Operaciones de bajísimo nivel o máximo rendimiento. |
| **plpythonu** | Python (untrusted). Requiere instalar la extensión. | Análisis de datos complejo, integración con APIs o IA. |
| **plv8** | JavaScript (V8 Engine). Requiere extensión. | Manipulación de JSON compleja o lógica compartida con el frontend. Permite usar TypeScript (transpilado). |
| **plr** | R language. Requiere extensión. | Estadísticas avanzadas y visualización. |

**Ejemplo de función en lenguaje SQL puro:**
```sql
CREATE FUNCTION suma(a int, b int) RETURNS int
AS 'SELECT a + b'
LANGUAGE sql;
```