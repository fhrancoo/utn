# Tipos de Datos en PostgreSQL

[Fuente (Documentación Oficial 8.1)](https://www.postgresql.org/docs/current/datatype.html)

A continuación se detallan los tipos de datos más utilizados en PostgreSQL, sus características y ejemplos de uso.

## 1. Tipos Numéricos

| Nombre | Descripción | Rango / Almacenamiento | Ejemplo |
| :--- | :--- | :--- | :--- |
| `integer` | Entero estándar de 4 bytes | -2,147,483,648 a +2,147,483,647 | `42` |
| `bigint` | Entero de 8 bytes para números grandes | -9.22e18 a +9.22e18 | `9223372036854775807` |
| `numeric(p, s)` | Precisión exacta, ideal para dinero | Hasta 131072 dígitos | `123.45` |
| `serial` | Entero autoincremental (4 bytes) | 1 a 2,147,483,647 | `id SERIAL PRIMARY KEY` |
| `bigserial` | Entero autoincremental grande (8 bytes) | 1 a 9.22e18 | `id BIGSERIAL PRIMARY KEY` |

**Ejemplo de tabla:**
```sql
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    precio NUMERIC(10, 2),
    stock INTEGER
);
```

## 2. Tipos de Caracteres (Strings)

| Nombre | Descripción | Ejemplo |
| :--- | :--- | :--- |
| `varchar(n)` | Longitud variable con límite `n` | `'Juan Pérez'` |
| `text` | Longitud variable ilimitada (recomendado) | `'Un comentario muy largo...'` |
| `char(n)` | Longitud fija (rellena con espacios) | `'AR '` (para ISO country code) |

**Ejemplo:**
```sql
CREATE TABLE usuarios (
    username VARCHAR(50),
    bio TEXT
);
```

## 3. Tipos de Fecha y Hora

| Nombre | Descripción | Ejemplo |
| :--- | :--- | :--- |
| `date` | Solo fecha (año, mes, día) | `'2024-03-12'` |
| `timestamp` | Fecha y hora (sin zona horaria) | `'2024-03-12 15:30:00'` |
| `timestamptz` | Fecha y hora **con** zona horaria (recomendado) | `'2024-03-12 15:30:00-03'` |

**Ejemplo:**
```sql
CREATE TABLE eventos (
    nombre VARCHAR(100),
    fech-inicio TIMESTAMPTZ DEFAULT NOW()
);
```

## 4. Tipo Booleano

| Nombre | Descripción | Valores permitidos |
| :--- | :--- | :--- |
| `boolean` | Estado lógico | `true`, `false`, `NULL` |

**Ejemplo:**
```sql
ALTER TABLE usuarios ADD COLUMN es_activo BOOLEAN DEFAULT true;
```

## 5. Tipos Especiales (Modernos)

### JSONB (Binary JSON)
Recomendado sobre `json` por ser más rápido para procesar y soportar indexación.

**Ejemplo:**
```sql
CREATE TABLE configuracion (
    data JSONB
);

INSERT INTO configuracion (data) VALUES ('{"tema": "oscuro", "notificaciones": true}');
```

### UUID (Universally Unique Identifier)
Ideal para claves primarias en sistemas distribuidos.

**Ejemplo:**
```sql
CREATE TABLE logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mensaje TEXT
);
```

## 6. Tipos de Arrays

Permiten almacenar listas de valores de un mismo tipo de dato.

**Ejemplo:**
```sql
CREATE TABLE empleados (
    nombre VARCHAR(100),
    telefonos TEXT[]
);

INSERT INTO empleados (nombre, telefonos) VALUES ('Juan', ARRAY['11-1234-5678', '11-8765-4321']);
```

## 7. Tipos Geométricos

| Nombre | Descripción | Ejemplo |
| :--- | :--- | :--- |
| `point` | Punto en un plano (x, y) | `'(10, 20)'` |
| `line` | Línea infinita | `'{1, 2, 3}'` (Ax + By + C = 0) |
| `lseg` | Segmento de línea | `'((1,1), (2,2))'` |
| `box` | Caja rectangular | `'((1,1), (2,2))'` |
| `polygon` | Polígono cerrado | `'((0,0), (1,1), (2,0))'` |

**Ejemplo:**
```sql
CREATE TABLE sucursales (
    nombre VARCHAR(100),
    ubicacion POINT
);
```

## 8. Tipos de Red

| Nombre | Descripción | Ejemplo |
| :--- | :--- | :--- |
| `inet` | Dirección IPv4 o IPv6 | `'192.168.1.1'` |
| `cidr` | Rango de red IPv4 o IPv6 | `'192.168.1.0/24'` |
| `macaddr` | Dirección MAC | `'08:00:2b:01:02:03'` |

**Ejemplo:**
```sql
CREATE TABLE dispositivos (
    nombre VARCHAR(50),
    ip_address INET
);
```

## 9. Tipo Enumerado (Enum)

Permite crear un tipo de dato personalizado con una lista de valores estáticos.

**Ejemplo:**
```sql
CREATE TYPE estado_pedido AS ENUM ('pendiente', 'en_proceso', 'enviado', 'entregado');

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    estado estado_pedido
);
```
