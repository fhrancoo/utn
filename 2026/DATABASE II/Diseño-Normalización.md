# Bases de Datos I – Diseño y Normalización

## 1. ¿Por qué es importante el diseño de una base de datos?

Una base de datos mal diseñada genera problemas como:

* Datos duplicados
* Información inconsistente
* Dificultad para actualizar registros
* Mayor probabilidad de errores

### Ejemplo de mal diseño

| id | cliente | telefono | producto | precio | producto2 | precio2 |
| -- | ------- | -------- | -------- | ------ | --------- | ------- |
| 1  | Juan    | 123456   | Mouse    | 5000   | Teclado   | 8000    |

**Problemas:**

* ¿Qué pasa si el cliente compra 3 productos?
* Se repite información del cliente
* Es difícil modificar o mantener los datos

La solución a estos problemas es **normalizar la base de datos**.

---

# 2. Normalización

La normalización es un proceso para **organizar los datos de manera eficiente**, evitando redundancia y mejorando la integridad de la información.

---

## Primera Forma Normal (1NF)

**Reglas principales:**

* Cada columna debe contener **valores atómicos**
* No deben existir **listas o múltiples valores en una misma celda**

### Ejemplo incorrecto

| id | nombre | telefonos      |
| -- | ------ | -------------- |
| 1  | Juan   | 123456, 789101 |

### Ejemplo correcto

**Tabla personas**

| id | nombre |
| -- | ------ |
| 1  | Juan   |

**Tabla telefonos**

| id | persona_id | telefono |
| -- | ---------- | -------- |
| 1  | 1          | 123456   |
| 2  | 1          | 789101   |

---

## Segunda Forma Normal (2NF)

**Regla:**

Todos los atributos deben depender **completamente de la clave primaria**.

### Ejemplo

| alumno_id | materia_id | alumno_nombre | nota |
| --------- | ---------- | ------------- | ---- |

**Problema:**

`alumno_nombre` depende solo de `alumno_id`, no de la clave completa.

### Solución

**Tabla alumnos**

| id | nombre |
| -- | ------ |

**Tabla materias**

| id | nombre |
| -- | ------ |

**Tabla notas**

| alumno_id | materia_id | nota |
| --------- | ---------- | ---- |

---

## Tercera Forma Normal (3NF)

**Regla:**

No debe haber **dependencias transitivas**.

### Ejemplo

| alumno_id | nombre | codigo_postal | ciudad |
| --------- | ------ | ------------- | ------ |

Si el `codigo_postal` determina la `ciudad`, entonces hay redundancia.

### Solución

**Tabla alumnos**

| id | nombre | codigo_postal |
| -- | ------ | ------------- |

**Tabla codigos_postales**

| codigo_postal | ciudad |
| ------------- | ------ |

---

# 3. Tipos de Datos

Elegir correctamente el tipo de dato mejora el rendimiento y la integridad de la información.

## Tipos numéricos

```
INTEGER
BIGINT
NUMERIC
```

## Tipos de texto

```
TEXT
VARCHAR
CHAR
```

## Tipos de fecha y tiempo

```
DATE
TIMESTAMP
TIMESTAMPTZ
```

## Tipo booleano

```
BOOLEAN
```

## Otros tipos útiles

```
UUID
JSONB
ARRAY
```

---

# 4. Claves

## Clave primaria (Primary Key)

Identifica de forma única cada registro de una tabla.

```sql
id SERIAL PRIMARY KEY
```

**Propiedades:**

* No puede ser NULL
* Debe ser única

---

## Clave foránea (Foreign Key)

Permite relacionar tablas.

```sql
FOREIGN KEY (cliente_id)
REFERENCES clientes(id)
```

Sirve para mantener la **integridad referencial** entre tablas.

---

# 5. Integridad de los datos

## Integridad de entidad

Cada tabla debe tener una **clave primaria única**.

## Integridad referencial

Las claves foráneas deben apuntar a registros existentes.

Esto evita que existan relaciones inválidas entre tablas.

---

# 6. Idea clave

Un buen diseño de base de datos permite:

* Reducir redundancia
* Mantener consistencia en los datos
* Facilitar el mantenimiento del sistema
* Mejorar el rendimiento de consultas

Diseñar correctamente una base de datos es una de las tareas más importantes en el desarrollo de sistemas.

---

# 7. Ejercicio

Diseñar el modelo de base de datos para un sistema de fútbol.

Posibles tablas:

* equipos
* jugadores
* partidos
* goles

Intentar organizar el modelo aplicando **hasta la tercera forma normal (3NF)**.
