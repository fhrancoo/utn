# Introducción a NestJS

NestJS es un framework progresivo de Node.js para la construcción de aplicaciones del lado del servidor eficientes, confiables y escalables. Está construido con TypeScript y utiliza conceptos de Programación Orientada a Objetos (POO), Programación Funcional (PF) y Programación Reactiva Funcional (FRP).

## Características principales

- **Arquitectura escalable**: Inspirada en Angular, utiliza módulos, controladores y servicios.
- **Soporte TypeScript**: Desarrollado completamente en TypeScript con excelente soporte para tipos.
- **Versatilidad**: Compatible con REST API, GraphQL, WebSockets, Microservicios y más.
- **Inyección de Dependencias**: Sistema robusto de inyección de dependencias incorporado.
- **CLI poderosa**: Herramienta de línea de comandos para facilitar el desarrollo.

## Instalación

```typescript
npm i -g @nestjs/cli
nest new proyecto-nombre
```

## Estructura básica de un proyecto

```typescript
src/
  ├── app.controller.ts
  ├── app.service.ts
  ├── app.module.ts
  └── main.ts
```

## Conceptos fundamentales

1. **Controladores**: Manejan las solicitudes HTTP y delegan la lógica de negocio a los servicios.
2. **Servicios**: Contienen la lógica de negocio y son inyectables.
3. **Módulos**: Organizan la aplicación en bloques funcionales.
4. **Pipes**: Transforman y validan datos.
5. **Guards**: Manejan la autorización.
6. **Interceptores**: Añaden lógica extra antes/después del manejo de la solicitud.
