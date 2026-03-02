# CI/CD con GitHub Actions (NestJS + Svelte 5)

La Integración Continua (CI) y el Despliegue Continuo (CD) permiten automatizar las pruebas y el despliegue de nuestra aplicación cada vez que subimos código a GitHub.

## 1. ¿Qué es un Workflow?

Un workflow es un proceso automatizado que se configura en un archivo `.yml` dentro de la carpeta `.github/workflows/`.

## 2. Workflow de Integración Continua (`ci.yml`)

Este archivo correrá los tests cada vez que alguien haga un `push` o un `Pull Request` a la rama `main`.

```yaml
name: Continuous Integration

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: oven-sh/setup-bun@v1
      
      - name: Install Dependencies
        run: cd backend && bun install
        
      - name: Run Lint
        run: cd backend && bun run lint
        
      - name: Run Tests
        run: cd backend && bun run test

  test-frontend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: oven-sh/setup-bun@v1
      
      - name: Install Dependencies
        run: cd frontend && bun install
        
      - name: Run Tests
        run: cd frontend && bun run test
```

## 3. Workflow de Despliegue con Docker (`cd.yml`)

Este workflow construye las imágenes de Docker y las sube a un registro (como Docker Hub o GitHub Packages).

```yaml
name: Continuous Deployment

on:
  push:
    branches: [ main ]

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
          
      - name: Build and Push Backend
        uses: docker/build-push-action@v5
        with:
          context: ./backend
          push: true
          tags: tu-usuario/backend-app:latest

      - name: Build and Push Frontend
        uses: docker/build-push-action@v5
        with:
          context: ./frontend
          push: true
          tags: tu-usuario/frontend-app:latest
```

## 4. Secretos en GitHub

Para que el despliegue funcione, debes configurar los secretos en tu repositorio de GitHub:
1. Ve a **Settings** > **Secrets and variables** > **Actions**.
2. Agrega `DOCKERHUB_USERNAME` y `DOCKERHUB_TOKEN`.

---
**Tip para alumnos**: Empiecen configurando solo el `ci.yml`. Es fundamental que el código se testee automáticamente antes de intentar desplegarlo. ¡Un pipeline verde da mucha tranquilidad!
