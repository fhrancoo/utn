# Patrones Avanzados de TypeScript (Prog IV)

Para Programación IV, donde usamos microservicios y NestJS avanzado, necesitamos dominar TypeScript a un nivel más profundo.

## 1. Decoradores (El alma de NestJS)
Los decoradores son funciones que modifican clases, métodos o propiedades.

**Reto:** Crea un decorador simple `@Log` que imprima un mensaje cada vez que un método de una clase se llame.

```typescript
function Log(target: any, key: string, descriptor: PropertyDescriptor) {
  const originalMethod = descriptor.value;
  descriptor.value = function(...args: any[]) {
    console.log(`Llamando a ${key} con argumentos:`, args);
    return originalMethod.apply(this, args);
  };
  return descriptor;
}

class ProductService {
  @Log
  create(name: string) {
    console.log(`Creando producto: ${name}`);
  }
}
```

---

## 2. Inferencia y Tipos Condicionales
A veces el tipo de un valor depende del tipo de otro.

**Reto:** Usa un tipo condicional para crear `IsString<T>` que sea `true` si `T` es un string y `false` en caso contrario.

```typescript
type IsString<T> = T extends string ? true : false;
```

---

## 3. Mapped Types (Transformación de Tipos)
Los Mapped Types nos permiten crear nuevos tipos a partir de otros iterando sobre sus propiedades.

**Reto:** Crea un tipo `ReadonlyPartial<T>` que haga que todas las propiedades de `T` sean opcionales **y** de solo lectura.

```typescript
type ReadonlyPartial<T> = {
  readonly [P in keyof T]?: T[P];
};
```

---

## 4. Tipado de Microservicios (Message Patterns)
En NestJS usamos patrones de mensajes para los microservicios.

**Reto:** Define una interfaz de unión discriminada para los mensajes de tu microservicio:

```typescript
interface CreateUserMessage {
  cmd: 'create_user';
  payload: { email: string; name: string };
}

interface DeleteUserMessage {
  cmd: 'delete_user';
  payload: { id: number };
}

type UserMessage = CreateUserMessage | DeleteUserMessage;
```

**Reto:** Crea una función que reciba `UserMessage` y use un `switch` sobre `cmd` para que TypeScript autocomplete el `payload` correcto dentro de cada `case`.

---

## 5. Template Literal Types
Estos tipos nos permiten crear strings complejos con validación.

**Reto:** Crea un tipo `ApiEndpoint` que deba empezar siempre por `/api/v1/` seguido de cualquier string.

```typescript
type ApiEndpoint = `/api/v1/${string}`;
```

---
**Nota para los alumnos:** Estos patrones son lo que hace que NestJS sea tan potente y seguro. Si dominan esto, entenderán cómo funcionan los decoradores `@Injectable()`, `@Controller()`, etc.
