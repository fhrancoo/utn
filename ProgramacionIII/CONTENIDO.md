# Programación III - Contenido Sugerido (Enfoque Full-Stack)

## Objetivo
Introducir a los estudiantes en el desarrollo de aplicaciones web **full-stack**, construyendo una aplicación completa desde la base de datos hasta la interfaz de usuario, utilizando un stack de tecnologías moderno y de alto rendimiento.

---

### Módulo 1: Fundamentos del Desarrollo Backend con NestJS
- **1.1. Introducción a la Web y APIs:**
  - Arquitectura Cliente-Servidor y protocolo HTTP/S.
  - Diseño de APIs RESTful.
- **1.2. Ecosistema de Bun y NestJS:**
  - **Bun.js como runtime:** Configuración de NestJS con Bun.
  - **TypeScript Avanzado:** Decoradores, metadatos y configuración de NestJS.
- **1.3. Arquitectura de NestJS:**
  - Módulos, Controladores y Proveedores (Servicios).
  - Inyección de Dependencias: El corazón de NestJS.

### Módulo 2: Validación, Datos y Seguridad
- **2.1. Validación y Transformación de Datos:**
  - Uso de **class-validator** para validación de DTOs.
  - Uso de **class-transformer** para manipulación de objetos.
  - Pipes globales y personalizados.
- **2.2. Persistencia con Prisma ORM:**
  - Definición del esquema (`schema.prisma`).
  - Creación de un Prisma Service en NestJS.
  - Operaciones CRUD y manejo de relaciones.
- **2.3. Autenticación y Seguridad:**
  - Implementación de JWT con `@nestjs/jwt`.
  - Guards para protección de rutas.
  - Hashing de contraseñas y manejo de variables de entorno.

### Módulo 3: Desarrollo Frontend con Astro y Svelte 5
- **3.1. Introducción a Astro y su Ecosistema:**
  - **Astro como framework de islas:** Concepto de "Zero JS by default".
  - Creación de un proyecto con `bun create astro`.
  - Estructura de un proyecto Astro: `src/pages`, `src/components`, `src/layouts`.
  - Enrutamiento basado en archivos y componentes `.astro`.
- **3.2. Svelte 5: Reactividad Moderna:**
  - Introducción a **Svelte 5 y Runes:** `$state`, `$derived`, `$effect`.
  - Componentes `.svelte`, Snippets y paso de Props.
  - Interactividad en Astro: Directivas de hidratación (`client:load`, `client:visible`).
- **3.3. Estilos y Layouts:**
  - Integración de **TailwindCSS** en Astro.
  - Creación de layouts reutilizables y componentes de UI con Svelte 5.

### Módulo 4: Integración Full-Stack
- **4.1. Conexión Frontend-Backend:**
  - Consumo de APIs desde el servidor (SSR en Astro) y desde el cliente (Svelte).
  - Manejo de estados de carga y errores.
- **4.2. Formularios y Persistencia:**
  - Envío de datos desde Svelte 5 a nuestra API con Elysia.
  - Autenticación: Manejo de tokens en el navegador y protección de rutas en Astro.

### Proyecto Final
- **Desarrollo de una Aplicación Web Full-Stack Completa:**
  - **Ejemplo:** Un gestor de tareas (Todo App), un blog personal o un simple inventario.
  - **Requisitos:**
    - Backend con Bun, NestJS, Prisma, Class Validator y Class Transformer.
    - Frontend con Astro y Svelte 5.
    - Base de datos PostgreSQL.
    - Autenticación de usuarios (registro y login).
    - CRUD completo de al menos un recurso protegido por autenticación.
