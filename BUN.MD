# Comandos básicos de Bun:

---

### 🛠 **Proyectos Bun**

| Comando | Descripción | Shortcuts | Flags permitidas |  
|---------|------------|-----------|------------------|  
| `bun init` | Crea un proyecto de Bun en el directorio actual. | *(No tiene shortcuts)* | *(No tiene flags importantes)* |  
| `bun build` | Construye el proyecto para producción. | `bun b` | `--minify` (minifica el código), `--sourcemap` (genera mapas de fuente) |  
| `bun dev` | Inicia un servidor de desarrollo para el proyecto. | `bun d` | `--port [número]` (especifica el puerto del servidor), `--open` (abre el navegador automáticamente) |  
| `bun start` | Inicia una aplicación, similar a `bun dev`, pero para producción. | `bun s` | *(No tiene flags importantes)* |  
| `bun test` | Ejecuta las pruebas del proyecto (usando el framework de pruebas compatible). | `bun t` | `--watch` (observa los cambios y vuelve a ejecutar las pruebas), `--coverage` (muestra la cobertura de pruebas) |  


### 🔧 **Dependencias y scripts**  

| Comando | Descripción | Shortcuts | Flags permitidas |  
|---------|------------|-----------|------------------|  
| `bun install` | Instala las dependencias definidas en `package.json` o `bun.lockb`. | `bun i` | `--prod` (solo instala dependencias de producción), `--dev` (instala dependencias de desarrollo) |  
| `bun add [paquete]` | Agrega un paquete a las dependencias del proyecto. | `bun a` | `--dev` (como dependencia de desarrollo), `--peer` (como dependencia peer) |  
| `bun remove [paquete]` | Elimina un paquete de las dependencias. | `bun rm` | *(No tiene flags importantes)* |  
| `bun upgrade` | Actualiza todas las dependencias a sus últimas versiones. | `bun up` | `--major` (actualiza las dependencias a una versión mayor), `--latest` (actualiza a la última versión) |  
| `bun run [script]` | Ejecuta un script definido en el archivo `package.json`. | `bun r [script]` | *(No tiene flags importantes)* |  




### 🧪 **Pruebas y rendimiento**  

| Comando | Descripción | Shortcuts | Flags permitidas |  
|---------|------------|-----------|------------------|  
| `bun test` | Ejecuta las pruebas definidas en el proyecto. | `bun t` | `--watch` (observa los cambios y vuelve a ejecutar las pruebas), `--coverage` (muestra la cobertura de pruebas) |  


### 🚀 **Otras utilidades de Bun**

| Comando | Descripción | Shortcuts | Flags permitidas |  
|---------|------------|-----------|------------------|  
| `bun --help` | Muestra la ayuda y los comandos disponibles en Bun. | `bun h` | *(No tiene flags importantes)* |  
| `bun --version` | Muestra la versión instalada de Bun. | `bun -v` | *(No tiene flags importantes)* |  


# Bunx

---

El comando `bunx` es una herramienta que viene incluida en **Bun** para ejecutar binarios de paquetes directamente, sin necesidad de instalar o configurar manualmente esos binarios. Es similar a `npx` de **npm**, y se utiliza para ejecutar herramientas o scripts que están en el `node_modules/.bin` de tu proyecto sin tener que añadirlos a los scripts de `package.json` o instalarlos globalmente.

### ¿Cómo funciona `bunx`?
`bunx` se utiliza para ejecutar cualquier binario o comando de una dependencia que hayas instalado en tu proyecto. Esto te ahorra la necesidad de referenciar el binario con su ruta completa.

---

### 📂 **Comandos básicos con `bunx`**

| Comando | Descripción | Flags permitidas |  
|---------|------------|------------------|  
| `bunx [comando]` | Ejecuta un binario o script que está dentro de las dependencias del proyecto. | *(No tiene flags importantes)* |  
| `bunx [comando] [argumentos]` | Ejecuta un comando con sus argumentos, como si fuera un comando global. | *(No tiene flags importantes)* |  

### Ejemplo de uso:
1. Supón que instalas una herramienta como **Prettier** como una dependencia de tu proyecto:
   ```
   bun add prettier --dev
   ```

2. Para ejecutar **Prettier** sin tener que instalarlo globalmente, solo usa `bunx`:
   ```
   bunx prettier --write .
   ```

Esto ejecutará **Prettier** directamente sin tener que agregarlo a los scripts de `package.json` ni instalarlo globalmente.

---

### ¿Por qué usar `bunx`?
- **Ejecutar binarios locales**: Ideal para ejecutar herramientas de desarrollo (como linters, formatters, etc.) sin necesidad de instalarlas globalmente.
- **Eficiencia**: Evita tener que definir scripts adicionales en el `package.json` para herramientas que solo necesitas ejecutar de manera puntual.
- **Flexibilidad**: Es más directo y flexible que usar la ruta completa del binario.

---

### Comparación con otros gestores:
- **npm** usa `npx` para ejecutar comandos locales sin instalarlos globalmente.
- **Yarn** tiene `yarn dlx` para un propósito similar.

En resumen, **`bunx`** te permite ejecutar cualquier binario dentro de tu proyecto sin instalar nada globalmente ni configurar scripts adicionales. Es un atajo útil para hacer que tu flujo de trabajo sea más eficiente.