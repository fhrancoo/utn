# Template de Proyecto Full-Stack (NestJS + Astro + Svelte 5)

Este documento sirve como base para que los alumnos inicialicen su repositorio de proyecto final con la estructura correcta y todas las tecnologías pre-configuradas.

## 1. Estructura de Repositorio Monorepo

Recomendamos usar una carpeta raíz para todo el proyecto, separando el backend y el frontend.

```text
/mi-proyecto-final
├── backend/            # NestJS + Prisma + Bun
├── frontend/           # Astro + Svelte 5 + Tailwind
├── .github/            # GitHub Actions (CI/CD)
├── docker-compose.yml  # Orquestación completa
└── README.md           # Documentación del proyecto
```

## 2. Inicialización del Backend (NestJS)

```bash
# Entramos a la carpeta del proyecto
mkdir mi-proyecto-final && cd mi-proyecto-final

# Creamos el backend con NestJS y Bun
nest new backend --package-manager bun
cd backend
bun add @prisma/client class-validator class-transformer @nestjs/jwt @nestjs/passport passport passport-jwt bcrypt
bun add -D prisma @types/passport-jwt @types/bcrypt
bunx prisma init
```

## 3. Inicialización del Frontend (Astro + Svelte 5)

```bash
# Desde la raíz del proyecto
bun create astro@latest frontend -- --template minimal --install --no-git
cd frontend
bun astro add svelte tailwind
# Asegúrate de que Svelte esté en la versión 5 en package.json
```

## 4. Configuración del Docker Compose (`docker-compose.yml`)

Copia este contenido en la raíz de tu proyecto para poder levantar todo con un solo comando:

```yaml
services:
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: database
    ports:
      - "5432:5432"

  backend:
    build: ./backend
    ports:
      - "3000:3000"
    environment:
      DATABASE_URL: "postgresql://user:password@db:5432/database"
    depends_on:
      - db

  frontend:
    build: ./frontend
    ports:
      - "4321:4321"
    depends_on:
      - backend
```

## 5. El "Checklist" de Inicio

Antes de empezar a codear, asegúrense de:
1.  **Configurar Prisma**: Definir el primer modelo (`User`) y correr `bunx prisma migrate dev`.
2.  **Habilitar CORS**: En el `main.ts` de NestJS, para que el frontend pueda hablar con el backend.
    ```typescript
    app.enableCors();
    ```
3.  **Variable de Entorno en Frontend**: Crear un `.env` en el frontend con `PUBLIC_API_URL=http://localhost:3000`.

---
**Tip para alumnos**: Usar este template les ahorrará al menos un par de días de configuración y errores de conexión. ¡Enfóquense en la lógica de su aplicación!
