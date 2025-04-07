# 🧪 Examen Práctico - Desarrollo Fullstack (Astro + NestJS)

## 📝 Objetivo

Crear una aplicación web **Fullstack** que permita realizar operaciones **CRUD** (Crear, Leer, Actualizar, Eliminar) usando:

- **Frontend:** Astro
- **Backend:** NestJS

---

## 📌 Requisitos

### 🔧 Backend (NestJS)

1. Crear una API REST con NestJS.
2. Implementar un CRUD completo sobre un recurso llamado `Producto`.
3. Cada `Producto` debe tener la siguiente estructura:

```typescript
{
  id: number;
  nombre: string;
  descripcion: string;
  precio: number;
  disponible: boolean;
}
```

4. El backend debe tener las siguientes rutas:

- `GET /productos` – Obtener todos los productos.
- `GET /productos/:id` – Obtener un producto por ID.
- `POST /productos` – Crear un nuevo producto.
- `PATCH /productos/:id` – Actualizar un producto.
- `DELETE /productos/:id` – Eliminar un producto.

5. Usar un array en memoria como base de datos temporal:

```ts
const productos = [
  { id: 1, nombre: "Lapicera", descripcion: "Lapicera azul", precio: 25, disponible: true },
  { id: 2, nombre: "Cuaderno", descripcion: "Cuaderno rayado A4", precio: 150, disponible: true },
  { id: 3, nombre: "Mochila", descripcion: "Mochila escolar", precio: 900, disponible: false },
  { id: 4, nombre: "Cartuchera", descripcion: "Cartuchera de tela", precio: 200, disponible: true },
];
```

---

### 🖥️ Frontend (Astro)

1. Crear un frontend usando Astro.
2. Implementar botones para realizar todas las operaciones:
   - Obtener todos los productos
   - Obtener 1 producto
   - Crear producto
   - Editar producto
   - Eliminar producto
3. Cada botón debe hacer la request correspondiente al backend (fetch).
4. No es necesario usar estilos, pero se valorará buena presentación.

---

### 📃 Documentacion (Postman)

- Subir la coleccion a github (usar mismo repo).
- Documentar las 6 request ej.: (TEST, getOne, getAll, create, update, delete)

## 🎯 Entrega

- Subir el proyecto completo en un repositorio de GitHub. pasar enlace al grupo.
- El examen debe funcionar sin base de datos real (solo con el array en memoria).

---

## ✅ Criterios de evaluación

| Criterio                            | Puntos |
|-------------------------------------|--------|
| API funcional (NestJS)              | 30     |
| CRUD completo funcionando           | 30     |
| Documentacion en Postman            | 10     |
| Integración con Astro               | 10     |
| Uso de botones con `fetch`          | 10     |
| Buenas prácticas y claridad de código | 10     |
| **Total**                           | **100** |
