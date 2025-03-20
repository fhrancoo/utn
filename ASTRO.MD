# Introducción a Astro Framework

Astro es un framework web moderno diseñado para crear sitios web rápidos y orientados al contenido. Permite construir sitios web utilizando múltiples frameworks juntos mientras envía el mínimo JavaScript necesario al navegador.

## 1. Características principales

- **Rendimiento excepcional**: Astro genera sitios estáticos por defecto, enviando cero JavaScript al cliente.
- **Islands Architecture**: Permite hidratación parcial de componentes interactivos.
- **Múltiples frameworks**: Soporta React, Vue, Svelte, Preact y más.
- **Optimización automática**: Incluye optimización de imágenes, CSS y assets.

## 2. Estructura básica de un proyecto

```typescript
// src/pages/index.astro
---
// Componente Script (TypeScript)
interface Props {
  title: string;
}

const { title } = Astro.props;
const items = ["Inicio", "Acerca", "Contacto"];
---

<!-- Plantilla HTML -->
<html lang="es">
  <head>
    <title>{title}</title>
  </head>
  <body>
    <nav>
      {items.map(item => <a href={`/${item.toLowerCase()}`}>{item}</a>)}
    </nav>
  </body>
</html>
```

## 4. Islands Architecture

```typescript
---
// Ejemplo de un componente interactivo
import InteractiveCounter from '../components/Counter';
---

<div>
  <h1>Página estática</h1>
  <!-- Solo este componente se hidratará con JavaScript -->
  <InteractiveCounter client:load />
</div>
```

## 5. Ventajas principales

- **Rendimiento optimizado**: Envía menos JavaScript al cliente
- **SEO mejorado**: Renderizado en el servidor por defecto
- **Developer Experience**: Excelente soporte de TypeScript
- **Flexibilidad**: Usa cualquier framework UI o ninguno

## 7. Recursos útiles

- [Documentación oficial](https://docs.astro.build/es/)
