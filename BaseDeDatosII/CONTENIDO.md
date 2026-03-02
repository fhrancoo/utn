# Base de Datos II - Contenido Sugerido

## Objetivo
Profundizar en el diseño, gestión y optimización de bases de datos relacionales, e introducir conceptos de bases de datos NoSQL, preparando a los estudiantes para enfrentar desafíos de performance y escalabilidad en sistemas reales.

---

### Módulo 1: Modelado Avanzado y PostgreSQL Moderno
- **1.1. Diseño de Esquemas para Alto Rendimiento:**
  - Estrategias de indexación avanzada y optimización de almacenamiento.
  - Modelado para lectura intensiva vs. escritura intensiva.
- **1.2. Capacidades Modernas de PostgreSQL:**
  - `JSONB` para esquemas híbridos (SQL + NoSQL).
  - Tipos de datos especializados: `Vector` (para IA/embeddings), `Range`, `HSTORE`.
- **1.3. Lógica Programable en la Base de Datos:**
  - Funciones de ventana (Window Functions) y CTEs complejos.
  - Procedimientos almacenados y triggers para integridad y auditoría.

### Módulo 2: Optimización de Consultas y Performance
- **2.1. Índices en Profundidad:**
  - Tipos de índices: B-Tree, Hash, GiST, GIN. Cuándo usar cada uno.
  - Índices compuestos y parciales.
  - El comando `EXPLAIN ANALYZE`: Interpretación del plan de ejecución de una consulta.
- **2.2. Transacciones y Concurrencia:**
  - Propiedades ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad).
  - Niveles de aislamiento de transacción (Read Committed, Repeatable Read, Serializable).
  - `Deadlocks`: Qué son y cómo evitarlos.
- **2.3. Particionamiento de Tablas:**
  - Estrategias de particionamiento (por rango, por lista, por hash).
  - Beneficios para la performance en tablas muy grandes.

### Módulo 3: Arquitecturas de Bases de Datos Distribuidas
- **3.1. Replicación de Bases de Datos:**
  - Arquitectura Maestro-Esclavo (Leader-Follower).
  - Replicación síncrona vs. asíncrona.
  - Casos de uso: Alta disponibilidad (High Availability) y escalado de lecturas.
- **3.2. Sharding (Fragmentación):**
  - Concepto de sharding para escalar escrituras.
  - Estrategias de sharding (basado en rango, en hash, etc.).
  - Complejidades y desafíos del sharding.
- **3.3. Pooling de Conexiones:**
  - Por qué abrir y cerrar conexiones es costoso.
  - Herramientas como **PgBouncer** para gestionar un pool de conexiones y mejorar la performance.

### Módulo 4: Introducción a Bases de Datos NoSQL
- **4.1. ¿Cuándo usar NoSQL?**
  - Teorema CAP (Consistencia, Disponibilidad, Tolerancia a Particiones).
  - Diferencias fundamentales con el modelo relacional.
- **4.2. Tipos de Bases de Datos NoSQL:**
  - **Documentales (ej. MongoDB):** Casos de uso, modelado de datos.
  - **Clave-Valor (ej. Redis):** Ideal para caching, sesiones, etc.
  - **Orientadas a Columnas (ej. Cassandra):** Para Big Data y alta escritura.
  - **Grafos (ej. Neo4j):** Para modelar relaciones complejas.
- **4.3. Caso Práctico con Redis:**
  - Integración de **Redis** en una aplicación (Node.js/Bun) para cachear respuestas de la API.
  - Implementación de una estrategia de cache-aside.

### Proyecto Final
- **Diseño y optimización de un sistema de base de datos para un caso de alta demanda:**
  - Se presenta un escenario (ej. una red social, un sistema de logging, un e-commerce en Black Friday).
  - Los estudiantes deben:
    1. Diseñar el esquema relacional en PostgreSQL.
    2. Identificar consultas críticas y optimizarlas con índices.
    3. Proponer una arquitectura de replicación para alta disponibilidad.
    4. Integrar una base de datos NoSQL (Redis) para caching donde sea apropiado.
    5. Justificar todas las decisiones de diseño y arquitectura.
