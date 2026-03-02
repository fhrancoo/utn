# Guía de Vectores en PostgreSQL con `pgvector`

En la era de la IA, los vectores son la forma en que almacenamos "significado" (embeddings) de textos, imágenes o sonidos para realizar búsquedas semánticas.

## 1. ¿Qué es un Vector?
Es una lista de números que representa un punto en un espacio multidimensional. Si dos vectores están "cerca", significa que sus contenidos son semánticamente similares.

## 2. Habilitar la Extensión en PostgreSQL

Antes de empezar, debemos asegurarnos de tener la extensión `pgvector` instalada y habilitada:

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

## 3. Crear una Tabla con Vectores

Imaginemos que tenemos una tabla de productos y queremos buscar por similitud semántica en sus descripciones.

```sql
CREATE TABLE products (
  id serial PRIMARY KEY,
  name text,
  description text,
  embedding vector(3) -- Definimos un vector de 3 dimensiones para el ejemplo
);
```

## 4. Insertar Datos con Vectores

Los embeddings normalmente los genera una IA (como OpenAI o un modelo local), pero aquí insertamos valores manuales:

```sql
INSERT INTO products (name, description, embedding) VALUES
('Silla de oficina', 'Ergonómica y cómoda', '[0.1, 0.8, 0.2]'),
('Sillón de cuero', 'Lujoso para la sala', '[0.1, 0.9, 0.3]'),
('Mesa de madera', 'Resistente y rústica', '[0.7, 0.2, 0.1]');
```

## 5. Búsqueda por Similitud (Distancia del Coseno)

Para buscar los productos más similares a una "Silla de oficina" `[0.1, 0.8, 0.2]`, usamos el operador `<=>` (distancia del coseno):

```sql
SELECT name, description, 1 - (embedding <=> '[0.1, 0.8, 0.2]') AS similarity
FROM products
ORDER BY embedding <=> '[0.1, 0.8, 0.2]'
LIMIT 5;
```

### Operadores de Distancia:
- `<=>` Distancia del Coseno (Recomendada para embeddings de texto).
- `<->` Distancia L2 (Euclidiana).
- `<#>` Producto Interno.

## 6. Indexación para Performance

Para búsquedas rápidas en millones de vectores, usamos índices `IVFFlat` o `HNSW`:

```sql
CREATE INDEX ON products USING hnsw (embedding vector_cosine_ops);
```

---
**Nota para los alumnos:** En el proyecto final, usaremos esto para crear un sistema de recomendación o un buscador semántico que entienda el "significado" de lo que el usuario busca, no solo las palabras exactas.
