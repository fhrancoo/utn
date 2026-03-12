# Guía de pgAdmin 4 (v8.1) - Query Tool

El **Query Tool** es la herramienta principal de pgAdmin para escribir y ejecutar sentencias SQL. Aquí tienes algunos consejos y atajos para aprovecharlo al máximo en tus clases de **DATABASE II**.

---

## 1. Atajos de Teclado (Shortcuts)

Los atajos te ahorrarán mucho tiempo al trabajar:

| Acción | Atajo (Windows/Linux) |
| :--- | :--- |
| **Ejecutar consulta** | `F5` o `Alt + Shift + E` |
| **Explicar consulta (Explain)** | `F7` |
| **Explicar con análisis (Explain Analyze)** | `Shift + F7` |
| **Comentar/Descomentar líneas** | `Ctrl + /` |
| **Borrar consola** | `Ctrl + Alt + R` |
| **Abrir nueva pestaña de Query Tool** | `Ctrl + Alt + Q` |

---

## 2. Ejecución de código seleccionado
Si tienes varias consultas en la misma pestaña, puedes **seleccionar con el ratón** solo la parte que quieres ejecutar y presionar `F5`. pgAdmin solo ejecutará el código resaltado.

---

## 3. Pestañas de Resultados

- **Data Output**: Muestra las filas devueltas por un `SELECT`. Puedes exportar estos datos a CSV o JSON directamente desde el icono de descarga.
- **Messages**: Aquí verás si la consulta fue exitosa, cuántas filas afectó (`INSERT`, `UPDATE`, `DELETE`) y cuánto tiempo tardó.
- **Explain**: Si usas `F7`, aquí verás el gráfico del plan de ejecución (muy útil para el archivo de [Indices.md](file:///c%3A/Users/Usuario/Documents/Repos/utn/2026/DATABASE%20II/Indices.md)).

---

## 4. Visualización de Transacciones
En la barra de herramientas del Query Tool, verás un desplegable que dice **"No transaction"** o **"In transaction"**.
- Si ejecutas un `BEGIN;`, el estado cambiará a "In transaction".
- No olvides hacer `COMMIT;` o `ROLLBACK;`, de lo contrario, podrías bloquear tablas para otros procesos.

---

## 5. Historial de Consultas (Query History)
Si borraste algo por error o quieres ver qué ejecutaste ayer, ve a la pestaña **Query History** dentro del panel del Query Tool. Puedes filtrar por fecha y recuperar cualquier comando anterior.

---

## 6. Auto-completado
pgAdmin tiene auto-completado inteligente. Empieza a escribir el nombre de una tabla o columna y presiona `Ctrl + Espacio` para ver las sugerencias.
