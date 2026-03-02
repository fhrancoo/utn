# Microservicios TCP en NestJS

NestJS ofrece una abstracción poderosa para crear microservicios. Aquí veremos cómo configurar un sistema de comunicación básica usando el transportador TCP.

## 1. Instalación del Módulo

```bash
bun add @nestjs/microservices
```

## 2. Creando el Microservicio (`main.ts` del microservicio)

El microservicio se ejecuta como una aplicación independiente que escucha peticiones en un puerto específico.

```typescript
import { NestFactory } from '@nestjs/core';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.createMicroservice<MicroserviceOptions>(AppModule, {
    transport: Transport.TCP,
    options: {
      host: '127.0.0.1',
      port: 8877,
    },
  });
  await app.listen();
  console.log('Microservicio escuchando en TCP:8877');
}
bootstrap();
```

## 3. Escuchando Peticiones (`@MessagePattern`)

En lugar de `@Get()` o `@Post()`, usamos patrones de mensajes.

```typescript
import { Controller } from '@nestjs/common';
import { MessagePattern } from '@nestjs/microservices';

@Controller()
export class MathController {
  @MessagePattern({ cmd: 'sum' }) // Patrón de mensaje
  accumulate(data: number[]): number {
    return (data || []).reduce((a, b) => a + b, 0);
  }
}
```

## 4. El Cliente (API Gateway)

El Gateway es el punto de entrada que redirige las peticiones al microservicio.

```typescript
import { Injectable, Inject } from '@nestjs/common';
import { ClientProxy, ClientProxyFactory, Transport } from '@nestjs/microservices';

@Injectable()
export class AppService {
  private client: ClientProxy;

  constructor() {
    this.client = ClientProxyFactory.create({
      transport: Transport.TCP,
      options: {
        host: '127.0.0.1',
        port: 8877,
      },
    });
  }

  getSum(data: number[]) {
    return this.client.send({ cmd: 'sum' }, data); // Enviamos el patrón y los datos
  }
}
```

---
**Nota para los alumnos:** TCP es excelente para comunicación interna rápida. En el Módulo 3 veremos cómo llevar esto a contenedores Docker y cómo usar otros transportadores como Redis o RabbitMQ para mayor escalabilidad.
