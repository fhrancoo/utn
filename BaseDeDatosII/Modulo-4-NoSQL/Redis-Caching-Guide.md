# Redis y Estrategias de Caching

Cuando una base de datos relacional (como PostgreSQL) se vuelve lenta por la cantidad de datos, necesitamos una capa intermedia de memoria ultra rápida: **Redis**.

## 1. ¿Por qué Redis?
Redis es una base de datos **Clave-Valor** que vive en la memoria RAM. Esto la hace órdenes de magnitud más rápida que leer de un disco duro.

## 2. Instalación de Dependencias en NestJS

```bash
bun add @nestjs/cache-manager cache-manager cache-manager-redis-yet
```

## 3. Configuración del Módulo (`app.module.ts`)

```typescript
import { CacheModule } from '@nestjs/cache-manager';
import { redisStore } from 'cache-manager-redis-yet';

@Module({
  imports: [
    CacheModule.registerAsync({
      isGlobal: true,
      useFactory: async () => ({
        store: await redisStore({
          socket: { host: 'localhost', port: 6379 },
          ttl: 60 * 1000, // Tiempo de vida del cache (60 segundos)
        }),
      }),
    }),
  ],
})
export class AppModule {}
```

## 4. Uso del Cache en un Controlador (`products.controller.ts`)

Podemos cachear una respuesta entera automáticamente con un decorador:

```typescript
@Controller('products')
@UseInterceptors(CacheInterceptor) // Cachea automáticamente el GET
export class ProductsController {
  @Get()
  async findAll() {
    // Si el dato está en cache, NestJS lo devuelve directamente
    // sin ejecutar este método.
    return this.productsService.findAll();
  }
}
```

## 5. Estrategia "Cache Aside" (Manual)

A veces necesitamos un control más fino sobre cuándo guardar y cuándo borrar el cache.

```typescript
@Injectable()
export class ProductsService {
  constructor(@Inject(CACHE_MANAGER) private cacheManager: Cache) {}

  async findOne(id: number) {
    // 1. Intentamos buscar en el cache
    const cachedProduct = await this.cacheManager.get(`product_${id}`);
    if (cachedProduct) return cachedProduct;

    // 2. Si no está en cache, buscamos en la base de datos
    const product = await this.prisma.product.findUnique({ where: { id } });

    // 3. Guardamos en cache para la próxima vez
    await this.cacheManager.set(`product_${id}`, product, 3600); // 1 hora de TTL

    return product;
  }
}
```

---

## Estrategias Clave:
- **TTL (Time To Live)**: No dejes datos en cache para siempre. Ponles un tiempo de expiración.
- **Invalidación**: Cuando un dato cambie (`UPDATE` o `DELETE`), asegúrate de borrarlo del cache para que no quede información vieja.
- **Cache de Sesiones**: Redis es el lugar ideal para guardar tokens de sesión o carritos de compra temporales.

---
**Tip para alumnos**: No cacheen todo. Solo cacheen lo que se lee mucho y cambia poco. El cache mal usado puede traer problemas de inconsistencia de datos.
