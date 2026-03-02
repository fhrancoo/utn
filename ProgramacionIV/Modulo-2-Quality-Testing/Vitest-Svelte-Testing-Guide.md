# Pruebas Unitarias en Svelte 5 con Vitest

Vitest es el framework de pruebas más moderno y rápido para el ecosistema de Vite. Junto con `@testing-library/svelte`, podemos probar nuestros componentes Svelte 5 de forma profesional.

## 1. Instalación de Dependencias

```bash
bun add -D vitest jsdom @testing-library/svelte @testing-library/jest-dom
```

## 2. Configuración de `vitest.config.ts`

```typescript
import { defineConfig } from 'vitest/config';
import { svelte } from '@sveltejs/vite-plugin-svelte';

export default defineConfig({
  plugins: [svelte({ hot: !process.env.VITEST })],
  test: {
    environment: 'jsdom', // Emulamos un navegador
    globals: true,        // Permite usar describe, it, expect sin importarlos
    setupFiles: ['./vitest-setup.ts'],
  },
});
```

## 3. Ejemplo de Componente a Probar (`Counter.svelte`)

```svelte
<script>
  let { initialCount = 0 } = $props();
  let count = $state(initialCount);
</script>

<p>Contador: {count}</p>
<button onclick={() => count++}>Incrementar</button>
```

## 4. El Test (`Counter.test.ts`)

```typescript
import { render, screen, fireEvent } from '@testing-library/svelte';
import Counter from './Counter.svelte';

describe('Componente Counter', () => {
  it('debe mostrar el valor inicial correctamente', () => {
    render(Counter, { initialCount: 5 });
    const text = screen.getByText(/Contador: 5/i);
    expect(text).toBeInTheDocument();
  });

  it('debe incrementar el valor al hacer click', async () => {
    render(Counter, { initialCount: 0 });
    const button = screen.getByRole('button', { name: /incrementar/i });
    
    await fireEvent.click(button);
    
    const text = screen.getByText(/Contador: 1/i);
    expect(text).toBeInTheDocument();
  });
});
```

---

## Por qué es importante:
1. **Confianza**: Sabes que tus cambios no rompieron funcionalidades existentes.
2. **Documentación**: Los tests sirven como ejemplo de cómo se debe comportar un componente.
3. **Refactorización**: Puedes cambiar el código interno de un componente sin miedo mientras los tests sigan pasando.

---
**Tip para alumnos**: No intenten probar cada pequeña función. Prueben el **comportamiento** que el usuario final percibe.
