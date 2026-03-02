# Svelte 5 Runes - Cheat Sheet

Svelte 5 introduce los **Runes**, una nueva forma de manejar la reactividad que es más explícita, potente y fácil de usar fuera de los componentes `.svelte`.

## 1. `$state` - Estado Reactivo
Reemplaza a `let count = 0;`.

```svelte
<script>
  let count = $state(0);
  let user = $state({ name: 'Profe', age: 30 });

  function increment() {
    count += 1; // ¡Funciona con asignación directa!
    user.age += 1; // ¡Incluso en objetos anidados!
  }
</script>

<button onclick={increment}>
  {user.name} tiene {user.age} años. Contador: {count}
</button>
```

## 2. `$derived` - Valores Derivados
Reemplaza a `$: doubled = count * 2;`.

```svelte
<script>
  let count = $state(2);
  let doubled = $derived(count * 2);
  let tripled = $derived(count * 3);
</script>

<p>Doble: {doubled}</p>
<p>Triple: {tripled}</p>
```

## 3. `$effect` - Efectos Secundarios
Reemplaza a `$: { console.log(count); }` y al ciclo de vida `onMount`.

```svelte
<script>
  let count = $state(0);

  $effect(() => {
    console.log('El contador cambió a:', count);

    return () => {
      console.log('Limpieza antes del próximo cambio o destrucción');
    };
  });
</script>
```

## 4. `$props` - Recibir Propiedades
Reemplaza a `export let name;`.

```svelte
<script>
  let { name, initialCount = 0 } = $props();
  let count = $state(initialCount);
</script>

<h1>Hola {name}</h1>
```

## 5. Snippets - Reutilización de UI
Reemplaza a los `slots`. Son mucho más potentes y se pueden pasar como propiedades.

```svelte
{#snippet userCard(name, role)}
  <div class="card">
    <h3>{name}</h3>
    <p>Rol: {role}</p>
  </div>
{/snippet}

{@render userCard('Juan', 'Estudiante')}
{@render userCard('Ana', 'Profesora')}
```

---
**Nota para los alumnos:** Ya no usamos `let count = 0` para reactividad, ahora siempre usamos `$state()`. ¡Es mucho más claro!
