# Transacciones y Concurrencia

Una **transacción** es una unidad lógica de trabajo que debe ejecutarse completamente o no ejecutarse en absoluto.

---

## 1. Propiedades ACID
Las bases de datos relacionales garantizan la integridad de los datos a través de estas cuatro reglas:

1. **A**tomicity (Atomicidad): Todo o nada. Si un paso falla, se deshace todo.
2. **C**onsistency (Consistencia): Los datos pasan de un estado válido a otro (respetando reglas y restricciones).
3. **I**solation (Aislamiento): Las transacciones no interfieren entre sí.
4. **D**urability (Durabilidad): Una vez confirmada, la transacción persiste (incluso si hay un fallo de energía).

---

## 2. Comandos de Transacción

- `BEGIN`: Inicia la transacción.
- `COMMIT`: Guarda los cambios de forma permanente.
- `ROLLBACK`: Deshace los cambios si algo salió mal.
- `SAVEPOINT`: Crea un punto de control intermedio para deshacer parcialmente.

**Ejemplo (Transferencia bancaria):**
```sql
BEGIN;

-- Paso 1: Restar dinero de la cuenta A
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;

-- Paso 2: Sumar dinero a la cuenta B
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;

-- Si todo salió bien
COMMIT;

-- Si hubo un error (ej. saldo insuficiente)
-- ROLLBACK;
```

---

## 3. Niveles de Aislamiento
PostgreSQL permite configurar cómo de aislada debe estar una transacción de las otras que ocurren simultáneamente.

| Nivel | Descripción |
| :--- | :--- |
| **Read Committed** | El nivel por defecto. Una transacción solo ve cambios confirmados de otras. |
| **Repeatable Read** | Una transacción solo ve los datos como estaban al empezar (evita "Lecturas no repetibles"). |
| **Serializable** | El nivel más alto. Garantiza que el resultado sea idéntico a si las transacciones se ejecutaran una tras otra. |

**Ejemplo de configuración:**
```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

---

## 4. MVCC (Multi-Version Concurrency Control)
PostgreSQL utiliza MVCC para permitir que **los lectores no bloqueen a los escritores y los escritores no bloqueen a los lectores**. 

- Cada transacción ve una "foto" (snapshot) de la base de datos en un momento dado.
- Esto mejora drásticamente el rendimiento en entornos con muchos usuarios concurrentes.
