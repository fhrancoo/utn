# Docker y Docker Compose para Full-Stack (NestJS + Astro + Postgres)

Containerizar nuestra aplicación nos permite asegurar que funcione igual en nuestra computadora que en el servidor. Usaremos **Bun** como base por su velocidad.

## 1. Dockerfile para el Backend (NestJS)

Creamos un `Dockerfile` en la carpeta `backend/`. Usamos *multi-stage builds* para que la imagen final sea liviana.

```dockerfile
# Etapa 1: Construcción
FROM oven/bun:1 AS builder
WORKDIR /app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
RUN bun run build

# Etapa 2: Ejecución
FROM oven/bun:1-slim
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000
CMD ["bun", "run", "dist/main.js"]
```

## 2. Dockerfile para el Frontend (Astro)

Astro genera archivos estáticos o puede correr como servidor SSR. Aquí lo configuramos como servidor SSR.

```dockerfile
FROM oven/bun:1 AS builder
WORKDIR /app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
RUN bun run build

EXPOSE 4321
ENV HOST=0.0.0.0
CMD ["bun", "./dist/server/entry.mjs"]
```

## 3. Orquestación con `docker-compose.yml`

Este archivo levanta todo el ecosistema (BD, Backend y Frontend) y los conecta entre sí.

```yaml
services:
  db:
    image: postgres:16-alpine
    restart: always
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: my_database
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  backend:
    build: ./backend
    restart: always
    environment:
      DATABASE_URL: "postgresql://user:password@db:5432/my_database"
      JWT_SECRET: "mi_secreto_super_seguro"
    ports:
      - "3000:3000"
    depends_on:
      - db

  frontend:
    build: ./frontend
    restart: always
    environment:
      API_URL: "http://backend:3000"
    ports:
      - "4321:4321"
    depends_on:
      - backend

volumes:
  postgres_data:
```

## Cómo correrlo:
1. Asegúrate de tener Docker instalado.
2. En la raíz del proyecto, ejecuta:
   ```bash
   docker compose up --build
   ```

---
**Tip para alumnos**: Usar `depends_on` asegura que el backend no intente arrancar antes de que la base de datos esté lista. Sin embargo, Prisma a veces necesita un "wait-for-it" o reintentos en el código para conectar correctamente.
