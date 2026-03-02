# Ejercicio: Refactorización a Arquitectura Modular

Uno de los errores más comunes cuando se empieza es poner toda la lógica en un solo archivo. Esto hace que el código sea imposible de mantener.

## El Problema: "El Controlador Gigante"

Imagina que recibes un proyecto donde el archivo `app.controller.ts` tiene **toda** la lógica: registro de usuarios, login, validación de productos y conexión directa a la base de datos.

```typescript
// app.controller.ts (MAL PRÁCTICA)
@Controller()
export class AppController {
  @Post('auth/register')
  async register(@Body() data: any) {
    // Lógica de registro...
  }

  @Post('auth/login')
  async login(@Body() data: any) {
    // Lógica de login...
  }

  @Get('users')
  async getUsers() {
    // Lógica de usuarios...
  }

  @Post('products')
  async createProduct(@Body() data: any) {
    // Lógica de productos...
  }
}
```

## El Desafío: Modularizar

Tu tarea es refactorizar este código siguiendo la estructura profesional que definimos en [Backend-Structure.md](file:///c%3A/Users/Usuario/Documents/Repos/utn/ProgramacionIII/Modulo-1-NestJS-Foundations/Backend-Structure.md).

### Tareas:
1.  **Crear los Módulos**: Separa la lógica en tres módulos: `AuthModule`, `UsersModule` y `ProductsModule`.
2.  **Mover los Servicios**: Crea un servicio para cada módulo (`AuthService`, `UsersService`, `ProductsService`) y mueve la lógica de negocio allí.
3.  **Implementar DTOs**: Crea archivos `.dto.ts` en cada módulo y usa `class-validator` para validar los datos que entran (en lugar de usar `any`).
4.  **Inyección de Dependencias**: Asegúrate de que el `AuthService` inyecte el `UsersService` para verificar si un usuario existe (en lugar de llamar a la DB directamente).
5.  **Configurar `AppModule`**: Limpia el módulo raíz para que solo importe los otros módulos.

## Por qué hacemos esto:
- **Testabilidad**: Es mucho más fácil probar un servicio pequeño que un controlador gigante.
- **Reutilización**: Si necesitas crear un usuario desde otra parte del sistema, solo inyectas el `UsersService`.
- **Orden**: Cada archivo tiene una sola responsabilidad (**Single Responsibility Principle**).

---
**Tip para alumnos**: Si sientes que un archivo tiene más de 200 líneas, probablemente sea hora de dividirlo. ¡El orden ahorra horas de debugueo!
