# 📘 **Recuperatorio - Examen Práctico Fullstack (Astro + NestJS)**

## 🎯 Objetivo

Crear una **aplicación web fullstack** que permita realizar operaciones **CRUD** sobre un recurso llamado `Libro`, utilizando:

- 🔧 **Backend:** NestJS  
- 🖥️ **Frontend:** Astro

---

## 🛠️ Requisitos

### 📦 Backend (NestJS)

1. Crear una **API REST** funcional.
2. Implementar un **CRUD completo** para el recurso `Libro`, con la siguiente estructura:

```ts
{
  id: number;
  titulo: string;
  autor: string;
  anio: number;
  disponible: boolean;
}
```

3. Usar un **array en memoria** como base de datos temporal:

```ts
const libros = [
  { id: 1, titulo: "1984", autor: "George Orwell", anio: 1949, disponible: true },
  { id: 2, titulo: "Cien años de soledad", autor: "Gabriel García Márquez", anio: 1967, disponible: true },
  { id: 3, titulo: "El Principito", autor: "Antoine de Saint-Exupéry", anio: 1943, disponible: false },
  { id: 4, titulo: "Fahrenheit 451", autor: "Ray Bradbury", anio: 1953, disponible: true },
];
```

4. Las rutas requeridas son:

| Método | Ruta              | Acción                       |
|--------|-------------------|------------------------------|
| GET    | `/libros`         | Listar todos los libros      |
| GET    | `/libros/:id`     | Obtener un libro por ID      |
| POST   | `/libros`         | Crear un nuevo libro         |
| PATCH  | `/libros/:id`     | Editar un libro existente    |
| DELETE | `/libros/:id`     | Eliminar un libro            |

---

### 💻 Frontend (Astro)

1. Crear una interfaz con Astro que permita:
   - Ver todos los libros
   - Buscar un libro por ID
   - Crear un nuevo libro
   - Editar un libro existente
   - Eliminar un libro

2. Cada acción debe usar `fetch` para comunicarse con el backend.

⚠️ No se pide diseño avanzado, pero se valora **presentación ordenada** y **claridad**.

---

### 📑 Documentación (Postman)

- Crear una colección en **Postman** con las 6 requests necesarias.
- Incluir ejemplo de datos para crear, editar, etc.
- Subir la colección al **mismo repositorio en GitHub**.

---

## 📤 Entrega

- Subir el proyecto completo a GitHub.
- No debe requerir base de datos real.
- Enviar el link del repositorio una vez finalizado.

---

## 🧮 Evaluación

| Criterio                            | Puntos |
|-------------------------------------|--------|
| API funcional (NestJS)              | 30     |
| CRUD completo funcionando           | 30     |
| Documentación en Postman            | 10     |
| Integración con Astro               | 10     |
| Uso de botones con `fetch`          | 10     |
| Buenas prácticas y claridad de código | 10     |
| **Total**                           | **100** |
