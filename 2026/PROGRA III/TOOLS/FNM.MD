# FNM (Fast Node Manager)

Es una herramienta para gestionar múltiples versiones de Node.js de manera rápida y sencilla.

Pagina oficial: [https://github.com/Schniz/fnm](https://github.com/Schniz/fnm)

Caso Windows:

1. Instalar FNM:

   ```powershell
   winget install Schniz.fnm
   ```

2. Configurar FNM:

   ```powershell
   code $PROFILE
   ```

   Agregar la siguiente linea al archivo:

   ```powershell
   fnm env --use-on-cd | Out-String | Invoke-Expression
   ```

3. Cerrar y abrir una nueva terminal.

4. Verificar la instalación:

   ```powershell
   fnm -v
   ```

5. Instalar una version de Node.js:

   ```powershell
   fnm list-remote
   fnm install vXX.XX.XX
   fnm use default
   ```

6. Verificar node.js:

   ```powershell
   node -v
   ```

---

> ## Nota
   >
   > Si tenemos problema de ejecucion de scripts, debemos ejecutar el siguiente comando como administrador:
   >
   > ```powershell
   > Set-ExecutionPolicy RemoteSigned
   >```
