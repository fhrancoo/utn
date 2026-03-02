# Estructura de Proyecto Frontend (Astro + Svelte 5)

Astro tiene una estructura de carpetas muy específica para su enrutamiento y componentes. Aquí tienes cómo organizar un proyecto frontend moderno.

```text
frontend/
├── public/                  # Archivos estáticos (imágenes, fuentes, etc.)
│   └── favicon.svg
├── src/
│   ├── components/          # Componentes reutilizables
│   │   ├── ui/              # Botones, inputs, modales (Tailwind + Svelte)
│   │   ├── layout/          # Navbar, Footer, Sidebar
│   │   └── shared/          # Componentes transversales
│   ├── layouts/             # Plantillas base de página (Astro)
│   │   └── BaseLayout.astro # El layout con <head>, <body>, etc.
│   ├── pages/               # Enrutamiento basado en archivos
│   │   ├── auth/            # Rutas de autenticación
│   │   │   ├── login.astro  # Página de Login
│   │   │   └── register.astro
│   │   ├── products/        # Rutas de productos
│   │   │   ├── index.astro  # Listado de productos
│   │   │   └── [id].astro   # Detalle de un producto (Ruta dinámica)
│   │   └── index.astro      # Página principal (Home)
│   ├── services/            # Llamadas a la API (NestJS)
│   │   ├── api.ts           # Configuración base de fetch/axios
│   │   ├── auth.service.ts
│   │   └── products.service.ts
│   ├── stores/              # Estado global (Zustand o Svelte Runes fuera de componentes)
│   │   └── user.svelte.ts   # Estado reactivo global del usuario
│   ├── styles/              # CSS global y configuración de Tailwind
│   │   └── global.css
│   └── utils/               # Funciones de ayuda (formateo de fechas, etc.)
│       └── formatters.ts
├── .env                     # Variables de entorno (API_URL)
├── astro.config.mjs         # Configuración de Astro e integraciones
├── bun.lockb                # Lockfile de Bun
├── package.json
├── tailwind.config.mjs      # Configuración de Tailwind CSS
└── tsconfig.json
```

## Por qué esta estructura:
1. **Pages**: Es el estándar de Astro. Cada archivo `.astro` dentro de `src/pages` es una ruta automática.
2. **Components**: Separamos los componentes en categorías (UI, Layout, Shared) para no tener cientos de archivos en una sola carpeta.
3. **Services**: Centralizamos las llamadas al backend en una carpeta específica. Esto nos permite cambiar de API o manejar errores de forma global en un solo lugar.
4. **Stores**: Con Svelte 5, podemos usar archivos `.svelte.ts` para tener un estado reactivo global (como el usuario logueado) fuera de los componentes.
5. **Layouts**: Nos permiten no repetir el `<head>` y el pie de página en cada archivo `.astro`.

---
**Tip para alumnos**: Recuerden que en Astro, el código dentro de `src/pages` corre mayormente en el servidor (SSR), mientras que los componentes de Svelte en `src/components` son los que tienen la interactividad del lado del cliente.
