# Integración Astro + Svelte 5 + API NestJS

En este módulo conectaremos nuestro frontend con el backend que construimos en el Módulo 1 y 2.

## 1. Instalación de Dependencias

```bash
bun add @tanstack/svelte-query
```

## 2. Consumo de API en Svelte 5

Usamos el nuevo rune `$state` para manejar el estado de nuestra petición.

```svelte
<script>
  let products = $state([]);
  let loading = $state(true);
  let error = $state(null);

  $effect(async () => {
    try {
      const response = await fetch('http://localhost:3000/products');
      if (!response.ok) throw new Error('No se pudo obtener los productos');
      products = await response.json();
    } catch (e) {
      error = e.message;
    } finally {
      loading = false;
    }
  });
</script>

{#if loading}
  <p>Cargando productos...</p>
{:else if error}
  <p style="color: red;">Error: {error}</p>
{:else}
  <ul>
    {#each products as product}
      <li>{product.name} - ${product.price}</li>
    {/each}
  </ul>
{/if}
```

## 3. Manejo de Formularios y POST

Enviamos datos de Svelte 5 a nuestro backend con NestJS.

```svelte
<script>
  let name = $state('');
  let price = $state(0);
  let isSubmitting = $state(false);

  async function handleSubmit() {
    isSubmitting = true;
    const response = await fetch('http://localhost:3000/products', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, price })
    });
    
    if (response.ok) {
      alert('¡Producto creado con éxito!');
      name = ''; price = 0;
    }
    isSubmitting = false;
  }
</script>

<form onsubmit={handleSubmit}>
  <input bind:value={name} placeholder="Nombre del producto" required />
  <input type="number" bind:value={price} placeholder="Precio" required />
  <button disabled={isSubmitting}>
    {isSubmitting ? 'Creando...' : 'Crear Producto'}
  </button>
</form>
```

## 4. SSR vs Cliente en Astro

En Astro podemos decidir dónde queremos que se ejecute el código:

- **En el Servidor (SSR):** Mejor para SEO y datos que no cambian.
- **En el Cliente (Isla de Svelte):** Necesario para interactividad y datos en tiempo real.

```astro
---
// Este código corre en el servidor (Astro)
const response = await fetch('http://localhost:3000/products');
const initialProducts = await response.json();
---

<!-- Pasamos los datos iniciales al componente de Svelte -->
<ProductList client:load products={initialProducts} />
```

---
**Nota para los alumnos:** Siempre validen los datos en el frontend antes de enviarlos, pero nunca confíen solo en eso. ¡La validación real siempre ocurre en el backend con `class-validator`!
