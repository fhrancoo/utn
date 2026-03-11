# Comandos básicos de Git:

---

### 📂 **Manejo de repositorios**  

| Comando | Descripción | Flags permitidas |  
|---------|------------|------------------|  
| `git init` | Inicializa un nuevo repositorio Git. | *(No tiene flags importantes)* |  
| `git clone [repositorio]` | Clona un repositorio remoto en tu máquina local. | `--branch [nombre]` (especifica una rama), `--depth [n]` (clona hasta cierto número de commits) |  
| `git status` | Muestra el estado de los archivos (modificados, no rastreados, etc.). | *(No tiene flags importantes)* |  
| `git log` | Muestra el historial de commits. | `--oneline` (muestra el historial en una línea), `--graph` (visualiza los commits como un gráfico de ramas) |  


### 📝 **Trabajar con archivos**  

| Comando | Descripción | Flags permitidas |  
|---------|------------|------------------|  
| `git add [archivo]` | Agrega cambios al área de preparación (staging area). | `-A` (agrega todos los archivos modificados), `.` (agrega todos los archivos en el directorio actual) |  
| `git commit -m "[mensaje]"` | Realiza un commit de los archivos agregados. | `--amend` (modificar el último commit), `--no-edit` (mantener el mensaje del commit anterior) |  
| `git diff` | Muestra las diferencias entre el área de trabajo y el área de preparación. | `--staged` (muestra las diferencias de los cambios que están en el área de preparación) |  
| `git rm [archivo]` | Elimina un archivo del repositorio. | `--cached` (elimina solo del área de preparación, no del disco) |  


### 🌿 **Ramas**  

| Comando | Descripción | Flags permitidas |  
|---------|------------|------------------|  
| `git branch` | Muestra las ramas locales. | `-a` (muestra todas las ramas, locales y remotas), `-d` (elimina una rama) |  
| `git checkout [rama]` | Cambia de rama. | `-b` (crea y cambia a una nueva rama) |  
| `git merge [rama]` | Fusiona otra rama a la rama actual. | *(No tiene flags importantes)* |  
| `git rebase [rama]` | Rebase la rama actual sobre otra. | `--interactive` (modo interactivo para reescribir la historia) |  


### 🔄 **Trabajo con repositorios remotos**  

| Comando | Descripción | Flags permitidas |  
|---------|------------|------------------|  
| `git remote -v` | Muestra los repositorios remotos. | *(No tiene flags importantes)* |  
| `git fetch` | Obtiene las actualizaciones de un repositorio remoto sin fusionarlas. | *(No tiene flags importantes)* |  
| `git pull` | Obtiene y fusiona las actualizaciones de un repositorio remoto. | `--rebase` (realiza un rebase en lugar de una fusión) |  
| `git push [remoto] [rama]` | Sube los cambios locales a un repositorio remoto. | `--force` (sobrescribir cambios en el remoto), `--set-upstream` (configura la rama remota de seguimiento) |  


### 🔄 **Revertir cambios**  

| Comando | Descripción | Flags permitidas |  
|---------|------------|------------------|  
| `git reset [archivo]` | Restablece un archivo del área de preparación. | `--hard` (restablece todos los cambios en el área de trabajo y el área de preparación) |  
| `git revert [commit]` | Crea un commit que revierte los cambios de un commit anterior. | *(No tiene flags importantes)* |  
| `git clean` | Elimina archivos no rastreados. | `-f` (forzar la eliminación), `-d` (eliminar directorios no rastreados) |  

## Referencias

Más información en [Hoja de trucos](https://git-scm.com/cheat-sheet).
