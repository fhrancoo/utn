# Manejo de Estado Global con Svelte 5 Runes

Cuando la aplicación crece, necesitamos compartir información (como el usuario logueado) entre muchos componentes. En Svelte 5, esto se hace de forma nativa y muy elegante usando archivos `.svelte.ts`.

## 1. El Concepto de "Shared State"

Ya no necesitamos "stores" tradicionales ni librerías externas. Podemos crear un archivo `.svelte.ts` que exporte un estado reactivo que cualquier componente puede importar y usar directamente.

### Crear el estado (`src/stores/auth.svelte.ts`)
```typescript
interface User {
  id: number;
  email: string;
}

function createAuthStore() {
  let user = $state<User | null>(null);
  let isAuthenticated = $derived(user !== null);

  return {
    get user() { return user; },
    get isAuthenticated() { return isAuthenticated; },
    login: (userData: User) => { user = userData; },
    logout: () => { user = null; }
  };
}

export const auth = createAuthStore();
```

## 2. Persistencia en LocalStorage (Nativo)

A veces queremos que el estado sobreviva a una recarga de página. Podemos integrar `localStorage` directamente en nuestro store de Svelte 5.

```typescript
function createPersistentUser() {
  const storedUser = typeof window !== 'undefined' ? localStorage.getItem('user') : null;
  let user = $state<User | null>(storedUser ? JSON.parse(storedUser) : null);

  $effect.root(() => {
    $effect(() => {
      if (user) {
        localStorage.setItem('user', JSON.stringify(user));
      } else {
        localStorage.removeItem('user');
      }
    });
  });

  return {
    get value() { return user; },
    set: (val: User | null) => { user = val; }
  };
}
```

## 3. Usarlo en un componente (`Navbar.svelte`)
```svelte
<script>
  import { auth } from '../stores/auth.svelte.ts';
</script>

<nav>
  {#if auth.isAuthenticated}
    <p>Hola, {auth.user?.email}</p>
    <button onclick={auth.logout}>Salir</button>
  {:else}
    <a href="/auth/login">Entrar</a>
  {/if}
</nav>
```

---

## ¿Por qué usar Runes para el estado global?
- **Sin Dependencias**: No necesitas instalar nada extra.
- **Tipado Nativo**: Funciona perfectamente con TypeScript.
- **Simplicidad**: Es exactamente igual que usar estado local dentro de un componente.

---
**Tip para alumnos**: No pongan todo en el estado global. Si un dato solo se usa en un componente, manténganlo como un `$state` local dentro de ese componente.
