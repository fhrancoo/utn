# Estructura de Proyecto Backend (NestJS)

Una buena estructura de carpetas es fundamental para que el proyecto sea escalable y fácil de mantener. Aquí tienes un ejemplo de cómo organizar un backend con NestJS.

```text
backend/
├── prisma/                  # Configuración de la base de datos
│   ├── schema.prisma        # Definición de modelos
│   └── seed.ts              # Datos iniciales (opcional)
├── src/
│   ├── auth/                # Módulo de Autenticación
│   │   ├── dto/             # Objetos de transferencia de datos (Login, Register)
│   │   ├── guards/          # Protecciones de rutas (JWT)
│   │   ├── auth.controller.ts
│   │   ├── auth.service.ts
│   │   └── auth.module.ts
│   ├── users/               # Módulo de Usuarios
│   │   ├── dto/             # CreateUserDto, UpdateUserDto
│   │   ├── entities/        # Entidades (si no usamos solo Prisma)
│   │   ├── users.controller.ts
│   │   ├── users.service.ts
│   │   └── users.module.ts
│   ├── products/            # Módulo de Productos (Ejemplo de recurso)
│   │   ├── dto/
│   │   ├── products.controller.ts
│   │   ├── products.service.ts
│   │   └── products.module.ts
│   ├── common/              # Código compartido entre módulos
│   │   ├── decorators/      # Decoradores personalizados
│   │   ├── filters/         # Filtros de excepciones
│   │   ├── pipes/           # Pipes de validación personalizados
│   │   └── prisma/          # Prisma Service y Module
│   ├── app.module.ts        # Módulo raíz de la aplicación
│   └── main.ts              # Punto de entrada (activación de ValidationPipe, etc.)
├── .env                     # Variables de entorno (DATABASE_URL, JWT_SECRET)
├── .gitignore
├── bun.lockb                # Lockfile de Bun
├── package.json
└── tsconfig.json
```

## Por qué esta estructura:
1. **Modularidad**: Cada funcionalidad (auth, users, products) tiene su propia carpeta con su controlador, servicio y módulo. Esto facilita el trabajo en equipo.
2. **DTOs**: Centralizamos la validación en la carpeta `dto` de cada módulo usando `class-validator`.
3. **Common**: Las cosas que se usan en muchos lados (como la conexión a la base de datos) van en una carpeta común para no repetir código.
4. **Prisma**: La carpeta `prisma/` está fuera de `src/` porque contiene archivos de configuración y migraciones, no código de la aplicación directamente.

---
**Tip para alumnos**: Cuando el proyecto crezca, agradezcan haber separado todo en módulos desde el principio. ¡No pongan todo en un solo controlador!
