# Autenticación JWT en NestJS

La autenticación mediante JSON Web Tokens (JWT) es el estándar para APIs modernas. En NestJS, esto se maneja de forma elegante con `@nestjs/jwt` y `Guards`.

## 1. Instalación de Dependencias

```bash
bun add @nestjs/jwt @nestjs/passport passport passport-jwt bcrypt
bun add -D @types/passport-jwt @types/bcrypt
```

## 2. El Servicio de Auth (`auth.service.ts`)

Este servicio se encarga de validar al usuario y generar el token.

```typescript
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { UsersService } from '../users/users.service';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService
  ) {}

  async signIn(email: string, pass: string): Promise<any> {
    const user = await this.usersService.findOne(email);
    const isMatch = await bcrypt.compare(pass, user?.password);
    
    if (!isMatch) {
      throw new UnauthorizedException();
    }
    
    const payload = { sub: user.id, email: user.email };
    return {
      access_token: await this.jwtService.signAsync(payload),
    };
  }
}
```

## 3. El Guard de Autenticación (`auth.guard.ts`)

Un `Guard` protege nuestras rutas. Si el token no es válido, NestJS bloquea la petición automáticamente.

```typescript
import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    const token = this.extractTokenFromHeader(request);
    
    if (!token) throw new UnauthorizedException();
    
    try {
      const payload = await this.jwtService.verifyAsync(token, {
        secret: process.env.JWT_SECRET
      });
      request['user'] = payload;
    } catch {
      throw new UnauthorizedException();
    }
    return true;
  }

  private extractTokenFromHeader(request: Request): string | undefined {
    const [type, token] = request.headers.authorization?.split(' ') ?? [];
    return type === 'Bearer' ? token : undefined;
  }
}
```

## 4. Protegiendo un Controlador

```typescript
import { Controller, Get, UseGuards } from '@nestjs/common';
import { AuthGuard } from './auth.guard';

@Controller('profile')
export class ProfileController {
  @UseGuards(AuthGuard) // Solo usuarios con JWT válido entran aquí
  @Get()
  getProfile() {
    return { message: 'Este es un contenido protegido' };
  }
}
```

---
**Nota para los alumnos:** Recuerden nunca guardar contraseñas en texto plano. Siempre usen `bcrypt` con un salt de al menos 10.
