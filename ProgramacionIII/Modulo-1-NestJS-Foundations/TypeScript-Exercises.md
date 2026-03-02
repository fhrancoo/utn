# Ejercicios Prácticos de TypeScript (Nivel Inicial/Medio)

Estos ejercicios están diseñados para fortalecer los conceptos de TypeScript que más usaremos en NestJS y Svelte 5.

## Ejercicio 1: Interfaces y Tipos Básicos
Define una interfaz `Product` que tenga:
- `id` (número)
- `name` (string)
- `price` (número)
- `category` (un literal de tipo: 'electrónica' | 'hogar' | 'ropa')
- `inStock` (booleano)

**Reto:** Crea una función `formatProduct(p: Product)` que devuelva un string con el nombre y el precio formateado (ej: "Laptop - $1200").

---

## Ejercicio 2: Opcionalidad y Readonly
Modifica la interfaz `User` para que:
- El `id` sea `readonly`.
- El `name` sea obligatorio.
- El `email` sea obligatorio.
- El `phoneNumber` sea opcional.

```typescript
interface User {
  readonly id: number;
  name: string;
  email: string;
  phoneNumber?: string; // Opcional
}
```

**Reto:** Intenta cambiar el `id` de un objeto `User` después de crearlo y observa qué dice el compilador.

---

## Ejercicio 3: Genéricos (Muy importante para NestJS)
Los genéricos permiten que las funciones o clases trabajen con diferentes tipos sin perder la seguridad del tipado.

**Reto:** Crea una interfaz `ApiResponse<T>` que tenga:
- `data`: de tipo `T`.
- `status`: número.
- `message`: string.

Luego, crea una variable que use esa interfaz para devolver un `Product` (del Ejercicio 1).

---

## Ejercicio 4: Utility Types (Pick, Omit, Partial)
TypeScript tiene utilidades para crear tipos a partir de otros.

**Reto:**
1. Usa `Partial<Product>` para crear un tipo `UpdateProductDto` (donde todos los campos sean opcionales).
2. Usa `Omit<Product, 'id'>` para crear un tipo `CreateProductDto` (donde el ID no exista).
3. Usa `Pick<Product, 'name' | 'price'>` para crear un tipo `ProductPreview`.

---

## Ejercicio 5: Enums vs Literales
A veces es mejor usar literales que Enums.

**Reto:** Crea un tipo `UserRole` que solo acepte 'ADMIN', 'USER', o 'GUEST'. Crea una función que reciba este tipo y use un `switch` para imprimir un mensaje diferente según el rol.

---

## Tips para los alumnos:
1. **No usen `any`**: Si usan `any`, están desactivando TypeScript. Si no saben el tipo, usen `unknown`.
2. **Lean los errores**: Los mensajes de error de TS suelen decir exactamente qué falta o qué sobra.
3. **Usen la inferencia**: No siempre es necesario poner `: string` si el valor inicial ya es un string.
