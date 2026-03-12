# Vistas (Views)

Una **vista (View)** es esencialmente una consulta guardada en la base de datos que se puede tratar como si fuera una tabla. No almacena datos físicamente (salvo las materializadas), sino que los recupera en tiempo real.

---

## 1. Vistas Simples
Se usan para simplificar consultas complejas o para ocultar columnas sensibles.

### Crear una vista
```sql
CREATE VIEW vista_pedidos_usuarios AS
SELECT u.nombre, p.monto, p.fecha
FROM usuarios u
JOIN pedidos p ON u.id = p.usuario_id;
```

### Consultar una vista
```sql
SELECT * FROM vista_pedidos_usuarios WHERE monto > 1000;
```

---

## 2. Vistas Materializadas
A diferencia de las simples, las **vistas materializadas** guardan físicamente el resultado de la consulta. Esto mejora drásticamente el rendimiento en consultas pesadas, pero los datos pueden quedar obsoletos.

### Crear vista materializada
```sql
CREATE MATERIALIZED VIEW reporte_ventas_mensuales AS
SELECT 
    EXTRACT(MONTH FROM fecha) as mes, 
    SUM(monto) as total
FROM pedidos
GROUP BY 1;
```

### Actualizar datos
Debes indicarle a PostgreSQL que vuelva a ejecutar la consulta para refrescar los datos.
```sql
REFRESH MATERIALIZED VIEW reporte_ventas_mensuales;
```

---

## 3. Ventajas de usar Vistas

| Ventaja | Descripción |
| :--- | :--- |
| **Simplicidad** | Encapsula JOINs y lógica compleja. El usuario solo ve una tabla simple. |
| **Seguridad** | Permite dar acceso a la vista pero no a las tablas base. |
| **Consistencia** | Asegura que todos usen la misma definición de un reporte o lógica. |
| **Rendimiento** | (Solo materializadas) Acelera consultas que involucran millones de filas. |

---

## 4. Eliminar una vista
```sql
DROP VIEW IF EXISTS vista_pedidos_usuarios;
DROP MATERIALIZED VIEW IF EXISTS reporte_ventas_mensuales;
```
