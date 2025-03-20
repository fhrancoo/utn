# Prisma - Guía de Introducción

## ¿Qué es Prisma?

Prisma es un ORM (Object-Relational Mapping) moderno que simplifica el trabajo con bases de datos. Ofrece:

- Un esquema declarativo intuitivo
- Generación de tipos TypeScript
- Cliente de base de datos type-safe
- Herramientas de migración
- GUI para gestionar datos

## Instalación

```bash
bun add prisma --dev
bun prisma init
```

## Ejemplo Básico del Schema

```typescript
datasource db {
  provider = "postgresql" // o "mysql" o "sqlite"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model Usuario {
  id        Int      @id @default(autoincrement())
  email     String   @unique
  nombre    String
  posts     Post[]
  createdAt DateTime @default(now())
}

model Post {
  id        Int      @id @default(autoincrement())
  titulo    String
  contenido String?
  publicado Boolean  @default(false)
  autor     Usuario  @relation(fields: [autorId], references: [id])
  autorId   Int
}
```

## Ejemplos Prácticos

### 1. Crear un Registro

```typescript
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function crearUsuario() {
  const usuario = await prisma.usuario.create({
    data: {
      email: 'ejemplo@correo.com',
      nombre: 'Juan Pérez',
    },
  })
  console.log(usuario)
}
```

### 2. Consultar Registros

```typescript
// Obtener todos los usuarios
const usuarios = await prisma.usuario.findMany()

// Obtener usuario con sus posts
const usuarioConPosts = await prisma.usuario.findUnique({
  where: { id: 1 },
  include: { posts: true }
})
```

### 3. Actualizar Registros

```typescript
const actualizarUsuario = await prisma.usuario.update({
  where: { id: 1 },
  data: { nombre: 'Juan Pablo Pérez' }
})
```

### 4. Eliminar Registros

```typescript
const eliminarUsuario = await prisma.usuario.delete({
  where: { id: 1 }
})
```

## Migraciones

```bash
# Crear una migración
bun prisma migrate dev --name init

# Aplicar migraciones en desarrollo
bun prisma migrate dev

# Aplicar migraciones en producción
bun prisma migrate deploy
```

## Prisma Studio

Para visualizar y editar tus datos mediante una interfaz gráfica:

```bash
bun prisma studio
```

## Mejores Prácticas

1. **Tipos de Datos**: Siempre define tipos explícitos para tus campos
2. **Relaciones**: Utiliza relaciones para mantener la integridad referencial
3. **Migraciones**: Realiza migraciones para cada cambio en el esquema
4. **Validación**: Aprovecha las restricciones del esquema para validar datos
5. **Transacciones**: Usa `prisma.$transaction` para operaciones atómicas

## Recursos Adicionales

- [Documentación Oficial](https://www.prisma.io/docs)
- [Ejemplos de Prisma](https://github.com/prisma/prisma-examples)
- [Prisma Studio](https://www.prisma.io/studio)
