# Introducción a TypeScript

TypeScript es un lenguaje de programación de código abierto desarrollado por Microsoft que extiende las capacidades de JavaScript añadiendo tipos estáticos y otras características avanzadas.

## 1. ¿Qué es TypeScript?

TypeScript es un superset de JavaScript que añade tipado estático opcional y características de programación orientada a objetos. Todo código JavaScript válido es también código TypeScript válido, pero TypeScript añade características adicionales que ayudan a desarrollar aplicaciones más robustas y mantenibles.

## 2. Ventajas de TypeScript

- **Tipado Estático**: Permite detectar errores durante el desarrollo
- **Mejor IntelliSense**: Mejor autocompletado y ayuda en el editor
- **Características Modernas**: Acceso a características de JavaScript moderno en navegadores antiguos
- **POO Avanzada**: Soporte completo para clases, interfaces y módulos
- **Compatibilidad**: Se compila a JavaScript, por lo que funciona en cualquier lugar

## 3. Sintaxis Básica

### Tipos Básicos

```typescript
// Tipos primitivos
let nombre: string = "Ana";
let edad: number = 25;
let esActivo: boolean = true;
let indefinido: undefined = undefined;
let nulo: null = null;

// Arrays
let numeros: number[] = [1, 2, 3];
let nombres: Array<string> = ["Ana", "Juan"];

// Tuplas
let tupla: [string, number] = ["hola", 10];

// Enum
enum DiaSemana {
    Lunes,
    Martes,
    Miercoles,
    Jueves,
    Viernes
}

// Any
let variable: any = "hola";
let variable: any = 10;

```

### Interfaces

```typescript
interface Usuario {
    nombre: string;
    edad: number;
    email?: string; // Propiedad opcional
}

const usuario: Usuario = {
    nombre: "Juan",
    edad: 30
};
```

### Clases

```typescript
class Persona {
    private nombre: string;
    
    constructor(nombre: string) {
        this.nombre = nombre;
    }
    
    saludar(): string {
        return `¡Hola, soy ${this.nombre}!`;
    }
}

 const juan = new Persona("Juan"); // returns Persona { nombre: "Juan" }
```

### Funciones

```typescript
// Función con tipos
function sumar(a: number, b: number): number {
    return a + b;
}

// Función con parámetro opcional
function saludar(nombre: string, apellido?: string): string {
    return apellido ? `Hola ${nombre} ${apellido}` : `Hola ${nombre}`;
}

// Arrow function con tipos
const multiplicar = (a: number, b: number): number => a * b;
```

## 4. Tipos Avanzados

### Union Types
```typescript
let codigoVariable: string | number;
codigoVariable = "abc123";
codigoVariable = 123;
```

### Type Aliases
```typescript
type Punto = {
    x: number;
    y: number;
};

const miPunto: Punto = { x: 10, y: 20 };
```

### Generics
```typescript
function obtenerPrimero<T>(array: T[]): T {
    return array[0];
}

const primerNumero = obtenerPrimero<number>([1, 2, 3]); // returns number
const primerTexto = obtenerPrimero<string>(["a", "b", "c"]); // returns string
```

### Optional Properties

```typescript
interface Usuario {
    nombre: string;
    edad?: number;
}

const usuario: Usuario = {
    nombre: "Juan"
};
```

### Readonly

```typescript
interface Usuario {
    readonly nombre: string;
    readonly edad: number;
}
```

### Omit / Pick / Partial

```typescript
interface Usuario {
    nombre: string;
    edad: number;
    email?: string;
}

type UsuarioSinEmail = Omit<Usuario, "email">; // Usuario sin email
type UsuarioConEmail = Pick<Usuario, "nombre" | "email">; // Usuario con email
type UsuarioCompleto = Partial<Usuario>; // Usuario completo, todos los campos opcionales
```

## 5.

## 6. Recursos Adicionales

- [Documentación Oficial de TypeScript](https://www.typescriptlang.org/docs/)
- [TypeScript en Microsoft Learn](https://learn.microsoft.com/es-es/training/paths/build-javascript-applications-typescript/)
- [TypeScript Playground](https://www.typescriptlang.org/play) 