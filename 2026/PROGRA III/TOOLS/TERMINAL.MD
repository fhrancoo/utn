# Comandos básicos de terminal, útiles tanto en Windows (PowerShell o CMD) como en Linux/macOS (Bash):

---

### 📁 **Manejo de archivos y directorios**  

| Comando | Descripción | Sistema | Flags permitidas |  
|---------|------------|---------|------------------|  
| `ls` (Linux/macOS) / `dir` (Windows) | Lista archivos y carpetas del directorio actual. | `ls` (Linux/macOS) / `dir` (Windows) | `ls -l` (lista detallada), `ls -a` (archivos ocultos), `ls -h` (tamaños legibles) |  
| `cd [ruta]` | Cambia de directorio. (`cd ..` para subir un nivel). | Ambos | *(No tiene flags)* |  
| `pwd` (Linux/macOS) | Muestra la ruta del directorio actual. | Linux/macOS | `-P` (ruta real sin enlaces simbólicos), `-L` (ruta con enlaces simbólicos) |  
| `mkdir [nombre]` | Crea una nueva carpeta. | Ambos | `-p` (Linux/macOS: crea estructura de directorios), `/p` (Windows CMD: crea estructuras) |  
| `rm [archivo]` (Linux/macOS) / `del [archivo]` (Windows) | Elimina un archivo. | `rm` (Linux/macOS) / `del` (Windows) | `-f` (forzar), `-i` (confirmar antes de borrar) |  
| `rm -r [carpeta]` (Linux/macOS) / `rmdir /s [carpeta]` (Windows) | Elimina una carpeta y su contenido. | `rm -r` (Linux/macOS) / `rmdir /s` (Windows) | `-f` (forzar), `-i` (confirmar antes de borrar) |  
| `rmdir [carpeta]` | Elimina una carpeta vacía. | Ambos | *(No tiene flags importantes)* |  
| `cp [origen] [destino]` (Linux/macOS) / `copy [origen] [destino]` (Windows) | Copia archivos o carpetas. | `cp` (Linux/macOS) / `copy` (Windows CMD) | `-r` (copiar directorios), `-f` (sobreescribir), `-u` (solo si es más reciente) |  
| `mv [origen] [destino]` (Linux/macOS) / `move [origen] [destino]` (Windows) | Mueve o renombra archivos y carpetas. | `mv` (Linux/macOS) / `move` (Windows CMD) | `-f` (sobreescribir sin preguntar), `-i` (preguntar antes de sobrescribir), `-u` (mover solo si es más reciente) |  


### 📜 **Visualización de archivos**  

| Comando | Descripción | Sistema | Flags permitidas |  
|---------|------------|---------|------------------|  
| `cat [archivo]` | Muestra el contenido del archivo. | Ambos | *(No tiene flags importantes)* |  
| `head [archivo]` | Muestra las primeras 10 líneas de un archivo. | Ambos | `-n` (número de líneas a mostrar) |  
| `tail [archivo]` | Muestra las últimas 10 líneas de un archivo. | Ambos | `-f` (seguir el archivo en tiempo real), `-n` (número de líneas a mostrar) |  


### 🔍 **Búsqueda y filtrado**  

| Comando | Descripción | Sistema | Flags permitidas |  
|---------|------------|---------|------------------|  
| `grep "texto" [archivo]` | Busca una palabra dentro de un archivo. | Linux/macOS | `-r` (buscar en directorios), `-i` (ignorar mayúsculas/minúsculas), `-v` (invertir coincidencia) |  
| `find [directorio] -name "[nombre]"` | Busca archivos por nombre. | Linux/macOS | `-type` (especificar tipo de archivo: f (archivo), d (directorio)), `-name` (por nombre), `-exec` (ejecutar comandos) |  
| `history` | Muestra el historial de comandos usados. | Linux/macOS | `-c` (limpiar historial), `-n` (mostrar líneas recientes) |  


### 🛠 **Gestión de procesos**  

| Comando | Descripción | Sistema | Flags permitidas |  
|---------|------------|---------|------------------|  
| `ps` | Muestra los procesos en ejecución. | Linux/macOS | `-e` (mostrar todos los procesos), `-f` (formato completo), `-u [usuario]` (mostrar procesos de un usuario específico) |  
| `top` / `htop` | Muestra procesos en tiempo real. | Linux/macOS | `-u [usuario]` (mostrar procesos de un usuario específico), `-p [PID]` (ver un proceso específico) |  
| `kill [PID]` | Finaliza un proceso con su ID. | Ambos | `-9` (forzar la terminación), `-l` (listar señales) |  
| `ctrl + C` | Detiene un proceso en ejecución. | Ambos | *(No tiene flags)* |


### 🔗 **Red y conectividad**  

| Comando | Descripción | Sistema | Flags permitidas |  
|---------|------------|---------|------------------|  
| `ping [dominio o IP]` | Verifica conectividad con un servidor. | Ambos | `-t` (Windows: especificar tiempo en segundos), `-c` (Linux/macOS: cantidad de paquetes) |  
| `curl [URL]` | Obtiene contenido de una página web. | Ambos | `-O` (guardar archivo), `-L` (seguir redirecciones), `-I` (mostrar encabezados) |  
| `wget [URL]` | Descarga archivos desde internet. | Linux/macOS | `-c` (continuar descarga), `-r` (descargar recursivamente) |  
| `ip a` (Linux) / `ipconfig` (Windows) | Muestra información de red. | `ip a` (Linux) / `ipconfig` (Windows) | *(No tiene flags importantes en `ipconfig` de Windows)* |  
