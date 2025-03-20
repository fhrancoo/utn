# Solicitudes HTTP en NestJS

## Métodos HTTP Principales

Los controladores en NestJS manejan diferentes tipos de solicitudes HTTP mediante decoradores:

```typescript
@Get()    // Obtener recursos
@Post()   // Crear recursos
@Put()    // Actualizar recursos completos
@Patch()  // Actualizar recursos parcialmente
@Delete() // Eliminar recursos
```

## Ejemplo de Controlador REST

```typescript
@Controller('usuarios')
export class UsuariosController {
  constructor(private usuariosService: UsuariosService) {}

  @Get()
  obtenerTodos(): Promise<Usuario[]> {
    return this.usuariosService.findAll();
  }

  @Get(':id')
  obtenerUno(@Param('id') id: string): Promise<Usuario> {
    return this.usuariosService.findOne(id);
  }

  @Post()
  crear(@Body() createUsuarioDto: CreateUsuarioDto): Promise<Usuario> {
    return this.usuariosService.create(createUsuarioDto);
  }
}
```

## Parámetros de Solicitud

### Decoradores para Parámetros
- `@Param()`: Parámetros de ruta
- `@Query()`: Parámetros de consulta
- `@Body()`: Cuerpo de la solicitud
- `@Headers()`: Encabezados HTTP
- `@Req()`: Objeto de solicitud completo

## Respuestas HTTP

### Códigos de Estado
```typescript
@Post()
@HttpCode(201) // Personalizar código de estado
crear(@Body() dto: CreateUsuarioDto) {
  return this.usuariosService.create(dto);
}
```

### Respuestas Personalizadas
```typescript
@Get()
@Header('Cache-Control', 'none') // Personalizar headers
obtenerTodos() {
  return this.usuariosService.findAll();
}
```

## DTOs (Data Transfer Objects)

```typescript
export class CreateUsuarioDto {
  @IsString()
  @IsNotEmpty()
  nombre: string;

  @IsEmail()
  email: string;

  @IsString()
  @MinLength(6)
  password: string;
}
```

## Manejo de Errores

```typescript
@Get(':id')
async obtenerUno(@Param('id') id: string) {
  const usuario = await this.usuariosService.findOne(id);
  if (!usuario) {
    throw new NotFoundException(`Usuario con ID ${id} no encontrado`);
  }
  return usuario;
}
```

## Validación de Solicitudes

Para habilitar la validación automática:

```typescript
app.useGlobalPipes(new ValidationPipe({
  transform: true,
  whitelist: true,
  forbidNonWhitelisted: true,
}));
```

## Documentación con Swagger

```typescript
@ApiTags('usuarios')
@Controller('usuarios')
export class UsuariosController {
  @ApiOperation({ summary: 'Obtener todos los usuarios' })
  @ApiResponse({ status: 200, description: 'Lista de usuarios obtenida con éxito' })
  @Get()
  obtenerTodos() {
    // ...
  }
}
```