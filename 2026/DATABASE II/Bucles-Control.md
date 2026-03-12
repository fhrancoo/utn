# Bucles y Control de Flujo en PostgreSQL (PL/pgSQL)

Los bucles permiten ejecutar repetidamente bloques de código en funciones, procedimientos o bloques anónimos. Estas estructuras solo funcionan dentro de **PL/pgSQL**.

---

## 1. Bucles (Loops)

### LOOP (Bucle Infinito)
Bucle básico que se ejecuta hasta que se encuentra un `EXIT` o `RETURN`.

```sql
LOOP
    -- lógica del bucle
    IF condicion THEN
        EXIT; -- Sale del bucle
    END IF;
END LOOP;
```

### WHILE
Se ejecuta mientras una condición booleana sea verdadera.

```sql
WHILE condicion LOOP
    -- lógica del bucle
END LOOP;
```

### FOR (Iteración sobre Rango)
Itera sobre un rango numérico definido.

```sql
-- Ejemplo de bucle FOR sobre un rango de 1 a 10
FOR i IN 1..10 LOOP
    RAISE NOTICE 'Iteración número %', i;
END LOOP;

-- Ejemplo en orden inverso
FOR i IN REVERSE 10..1 LOOP
    RAISE NOTICE 'Cuenta regresiva: %', i;
END LOOP;
```

### FOR (Iteración sobre Resultados de Consulta)
Itera sobre cada fila devuelta por una consulta `SELECT`.

```sql
FOR registro IN SELECT * FROM usuarios LOOP
    RAISE NOTICE 'Procesando usuario: %', registro.nombre;
END LOOP;
```

---

## 2. Control de Flujo y Mensajes

Estas herramientas permiten enviar información a la consola o detener la ejecución.

### RAISE (Mensajes y Errores)
Permite mostrar información o lanzar excepciones.

| Nivel | Descripción |
| :--- | :--- |
| `NOTICE` | Muestra un mensaje informativo en la consola de pgAdmin. |
| `WARNING` | Muestra una advertencia. |
| `EXCEPTION` | Detiene la ejecución, lanza un error y revierte la transacción. |

**Ejemplos:**
```sql
-- Imprimir mensaje
RAISE NOTICE 'El usuario % tiene un saldo de %', nombre_usuario, saldo_usuario;

-- Lanzar error con código personalizado
IF saldo < 0 THEN
    RAISE EXCEPTION 'Saldo insuficiente para realizar la operación';
END IF;
```

### CONTINUE / EXIT
- `CONTINUE`: Salta a la siguiente iteración del bucle.
- `EXIT`: Sale inmediatamente del bucle actual.

```sql
FOR i IN 1..10 LOOP
    IF i % 2 = 0 THEN
        CONTINUE; -- Salta números pares
    END IF;
    RAISE NOTICE 'Número impar: %', i;
END LOOP;
```
