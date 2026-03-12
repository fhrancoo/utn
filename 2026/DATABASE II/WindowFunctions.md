# Funciones de Ventana (Window Functions)

Las **Funciones de Ventana** realizan cálculos a través de un conjunto de filas que están relacionadas con la fila actual. A diferencia de las funciones de agregado (`SUM`, `AVG`, etc.), las funciones de ventana **no agrupan las filas** en una sola salida; mantienen la identidad de cada fila.

---

## 1. Cláusula OVER
Es la que define la "ventana" sobre la cual operará la función.

- **PARTITION BY**: Divide las filas en grupos (ventanas).
- **ORDER BY**: Define el orden de las filas dentro de cada ventana.

---

## 2. Funciones de Ranking
Ideales para crear listas de "Top 10", numerar filas o encontrar duplicados.

- **ROW_NUMBER()**: Asigna un número único secuencial a cada fila.
- **RANK()**: Asigna un rango, pero si hay empates, salta números (ej. 1, 2, 2, 4).
- **DENSE_RANK()**: Asigna un rango sin saltar números (ej. 1, 2, 2, 3).

**Ejemplo:**
```sql
-- Ranking de empleados por salario dentro de cada departamento
SELECT 
    nombre, 
    departamento, 
    salario,
    RANK() OVER(PARTITION BY departamento ORDER BY salario DESC) as ranking_salarial
FROM empleados;
```

---

## 3. Funciones de Agregado como Ventana
Puedes usar `SUM`, `AVG`, `COUNT`, etc., sin perder las filas individuales. Muy útil para **acumulados (Running Totals)**.

**Ejemplo de acumulado de ventas por mes:**
```sql
SELECT 
    fecha, 
    monto,
    SUM(monto) OVER(ORDER BY fecha) as acumulado_historico
FROM ventas;
```

---

## 4. Funciones de Valor (Navegación)
Permiten acceder a datos de otras filas sin usar `JOIN`s complejos.

- **LAG(columna, offset)**: Accede a la fila anterior.
- **LEAD(columna, offset)**: Accede a la fila siguiente.
- **FIRST_VALUE() / LAST_VALUE()**: Obtiene el primer o último valor de la ventana.

**Ejemplo: Comparar la venta actual con la del mes anterior:**
```sql
SELECT 
    mes, 
    monto_actual,
    LAG(monto_actual) OVER(ORDER BY mes) as monto_mes_anterior,
    monto_actual - LAG(monto_actual) OVER(ORDER BY mes) as diferencia
FROM reporte_mensual;
```

---

## 5. Cuándo usar Funciones de Ventana
1. **Reportes analíticos**: Rankings, comparaciones temporales (mes actual vs mes anterior).
2. **Limpieza de datos**: Identificar y numerar filas duplicadas para borrarlas.
3. **Optimización**: Evitan subconsultas pesadas o `SELF-JOIN`s innecesarios.
