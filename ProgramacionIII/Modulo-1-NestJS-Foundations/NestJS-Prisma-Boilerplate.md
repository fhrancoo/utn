# NestJS + Prisma + Bun - Boilerplate Base

Este documento contiene la estructura inicial recomendada para que los alumnos arranquen su proyecto backend con el stack moderno definido.

## 1. Inicialización con Bun

Para crear un nuevo proyecto NestJS usando Bun, se puede usar:

```bash
# Instalamos la CLI de NestJS si no la tenemos
bun add -g @nestjs/cli

# Creamos un nuevo proyecto (seleccionamos bun como gestor de paquetes si se pregunta)
nest new backend-project
```

## 2. Dependencias Necesarias

Instalar las dependencias para Prisma y validación:

```bash
bun add @prisma/client class-validator class-transformer
bun add -D prisma
```

## 3. Configuración de Prisma

Inicializar Prisma:

```bash
bunx prisma init
```

### Ejemplo de `schema.prisma`
```prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id        Int      @id @default(autoincrement())
  email     String   @unique
  name      String?
  password  String
  createdAt DateTime @default(now())
}
```

## 4. El Corazón de la Validación: `main.ts`

Es **fundamental** activar el `ValidationPipe` globalmente para que `class-validator` funcione.

```typescript
import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Activamos validación global
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,         // Elimina propiedades que no estén en el DTO
    forbidNonWhitelisted: true, // Lanza error si hay propiedades extras
    transform: true,         // Convierte tipos automáticamente (ej: string a number)
  }));

  await app.listen(3000);
  console.log(`Application is running on: ${await app.url()}`);
}
bootstrap();
```

## 5. Ejemplo de DTO con Validación

```typescript
import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';

export class CreateUserDto {
  @IsEmail({}, { message: 'El formato del email no es válido' })
  email: string;

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @MinLength(6, { message: 'La contraseña debe tener al menos 6 caracteres' })
  password: string;
}
```

---
**Tip Pro:** Usen siempre `bun run start:dev` para que el servidor se reinicie automáticamente al hacer cambios.
