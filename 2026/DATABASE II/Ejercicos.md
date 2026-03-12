# Ejercicios de Modelado y Normalización de Bases de Datos

## Ejercicio 1 – Sistema de pedidos

Se tiene la siguiente tabla que registra pedidos de una tienda.

| pedido_id | cliente | telefono | producto    | precio | cantidad |
| --------- | ------- | -------- | ----------- | ------ | -------- |
| 1         | Juan    | 123      | Mouse       | 5000   | 1        |
| 1         | Juan    | 123      | Teclado     | 8000   | 1        |
| 2         | Ana     | 456      | Monitor     | 50000  | 1        |
| 3         | Juan    | 123      | Auriculares | 12000  | 2        |

**Consigna**

1. Identificar datos que se repiten.
2. Proponer las tablas necesarias para evitar redundancia.
3. Definir claves primarias.
4. Definir claves foráneas entre las tablas.

---

# Ejercicio 2 – Sistema académico

Se tiene la siguiente tabla:

| alumno | materia    | profesor | aula |
| ------ | ---------- | -------- | ---- |
| Juan   | Matemática | Pérez    | A1   |
| Juan   | Física     | Gómez    | B2   |
| Ana    | Matemática | Pérez    | A1   |
| Pedro  | Física     | Gómez    | B2   |

**Consigna**

1. Identificar problemas de diseño.
2. Separar la información en tablas correctas.
3. Identificar las relaciones entre las tablas.
4. Indicar qué tabla representa la relación entre alumnos y materias.

---

# Ejercicio 3 – Sistema de películas

Tabla original:

| pelicula  | actor              | genero          | año  |
| --------- | ------------------ | --------------- | ---- |
| Matrix    | Keanu Reeves       | Ciencia ficción | 1999 |
| Matrix    | Laurence Fishburne | Ciencia ficción | 1999 |
| John Wick | Keanu Reeves       | Acción          | 2014 |
| Titanic   | Leonardo DiCaprio  | Drama           | 1997 |

**Consigna**

1. Detectar redundancias en la tabla.
2. Diseñar las tablas necesarias.
3. Identificar si existen relaciones muchos a muchos.
4. Proponer una tabla intermedia si es necesario.

---

# Ejercicio 4 – Sistema de biblioteca

Tabla inicial:

| libro                   | autor         | categoria    | editorial     |
| ----------------------- | ------------- | ------------ | ------------- |
| El Hobbit               | Tolkien       | Fantasía     | Minotauro     |
| El Señor de los Anillos | Tolkien       | Fantasía     | Minotauro     |
| Clean Code              | Robert Martin | Programación | Prentice Hall |
| Código Da Vinci         | Dan Brown     | Suspenso     | Planeta       |

**Consigna**

1. Identificar datos repetidos.
2. Diseñar tablas separadas para cada entidad.
3. Definir las claves primarias.
4. Indicar las relaciones entre las tablas.

---

# Ejercicio 5 – Sistema de fútbol

Tabla actual:

| partido | equipo_local | equipo_visitante | jugador     | goles |
| ------- | ------------ | ---------------- | ----------- | ----- |
| 1       | Boca         | River            | Cavani      | 1     |
| 1       | Boca         | River            | Borja       | 1     |
| 2       | Barcelona    | Real Madrid      | Lewandowski | 2     |
| 2       | Barcelona    | Real Madrid      | Vinicius    | 1     |

**Consigna**

1. Identificar qué entidades aparecen en la tabla.
2. Separar la información en tablas normalizadas.
3. Identificar las relaciones entre tablas.
4. Diseñar una tabla para registrar los goles.
