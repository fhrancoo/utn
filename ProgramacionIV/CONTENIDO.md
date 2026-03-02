# Programación IV - Contenido Sugerido (Arquitecturas Avanzadas y DevOps)

## Objetivo
Formar a los estudiantes en el diseño, construcción y despliegue de aplicaciones robustas, escalables y mantenibles, aplicando arquitecturas de software avanzadas, prácticas de DevOps y un fuerte enfoque en la calidad del software.

---

### Módulo 1: Arquitecturas Distribuidas con NestJS
- **1.1. Microservicios en NestJS:**
  - Transportadores: TCP, Redis, MQTT, NATS, RabbitMQ y gRPC.
  - El patrón Request-Response vs. Event-Based.
  - Implementación de un microservicio básico con `@nestjs/microservices`.
- **1.2. Patrones de Comunicación y Orquestación:**
  - **API Gateway:** Implementación de un gateway central para ruteo y agregación.
  - Manejo de fallos y resiliencia en microservicios NestJS.
- **1.3. Domain-Driven Design (DDD) con NestJS:**
  - Estructura de carpetas por dominios.
  - Uso de Value Objects, Entidades y Repositorios en NestJS.

### Módulo 2: Calidad y Pruebas de Software
- **2.1. Estrategias de Testing:**
  - La pirámide de testing (Unit, Integration, End-to-End).
  - Pruebas unitarias en **Svelte 5** con **Vitest**.
- **2.2. Pruebas de Integración:**
  - Pruebas de componentes Svelte y comunicación con el backend.
- **2.3. Pruebas End-to-End (E2E):**
  - Introducción a **Playwright**.
  - Automatización de flujos de usuario en aplicaciones Astro/Svelte.

### Módulo 3: Contenerización y Orquestación
- **3.1. Docker en Profundidad:**
  - Optimización de `Dockerfile` (multi-stage builds, capas de caché).
  - Redes en Docker (`bridge`, `host`).
- **3.2. Orquestación con `docker-compose`:**
  - Definición de un entorno multi-servicio (backend, frontend, base de datos, message broker).
  - Gestión de volúmenes, redes y variables de entorno para desarrollo.
- **3.3. Registros de Contenedores:**
  - Publicar imágenes en un registro como **Docker Hub** o **GitHub Container Registry (GHCR)**.

### Módulo 4: CI/CD y Despliegue Continuo
- **4.1. Introducción a CI/CD con GitHub Actions:**
  - ¿Qué es la Integración Continua y el Despliegue Continuo?
  - Creación de workflows (`.github/workflows`).
- **4.2. Construcción de un Pipeline Completo:**
  - **Jobs y Steps:** Ejecución de `lint`, `test`, `build`.
  - Automatización de la construcción y publicación de imágenes Docker.
- **4.3. Estrategias de Despliegue (Teórico):**
  - Blue-Green Deployment.
  - Canary Releases.
  - Introducción a la monitorización y el logging (Prometheus, Grafana).

### Proyecto Final
- **Ecosistema de Microservicios con NestJS:**
  - Descomponer la aplicación de Programación III en microservicios independientes.
  - Implementar comunicación asíncrona mediante el transportador de microservicios de NestJS.
  - Utilizar **class-validator** y **class-transformer** para asegurar la integridad de los datos entre servicios.
  - Contenerizar y desplegar el sistema completo con Docker.
