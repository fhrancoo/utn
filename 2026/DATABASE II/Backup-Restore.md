# Respaldo y Restauración (Backup & Restore)

En PostgreSQL, el respaldo y la restauración son fundamentales para la seguridad de los datos. No se hacen copiando archivos de carpetas; se usan herramientas especializadas.

---

## 1. pg_dump (Respaldo)
Se usa para exportar el contenido de una base de datos a un archivo (generalmente `.sql` o un formato binario).

### Exportar a archivo SQL (Lectura humana)
```bash
pg_dump -U usuario -d nombre_db > backup_db.sql
```

### Exportar en formato binario (Más rápido y comprimido)
```bash
# Se suelen usar extensiones como .dump, .backup o .bak
pg_dump -U usuario -F c -d nombre_db -f backup_db.bak
```

| Opción | Descripción |
| :--- | :--- |
| `-U` | Usuario de la base de datos. |
| `-d` | Nombre de la base de datos. |
| `-F c` | Formato custom (binario). Recomendado para backups grandes. |
| `-f` | Nombre del archivo de salida. |
| `-t` | (Opcional) Exportar solo una tabla específica. |

---

## 2. pg_restore y psql (Restauración)
Dependiendo de cómo hiciste el backup, se restaura de una forma u otra. **La extensión (.sql, .bak, .dump) es solo un nombre; lo que importa es el formato interno del archivo.**

### Restaurar un archivo SQL
```bash
psql -U usuario -d nombre_db -f backup_db.sql
```

### Restaurar un archivo binario (.dump, .backup, .bak)
```bash
pg_restore -U usuario -d nombre_db backup_db.bak
```

| Opción | Descripción |
| :--- | :--- |
| `-c` | Limpia (borra) los objetos antes de crearlos. |
| `-v` | Modo verbose (muestra el progreso). |
| `-j` | Número de hilos (para restaurar en paralelo y ser más rápido). |

---

## 3. Respaldo de todas las bases de datos
Si quieres respaldar el servidor completo (roles, permisos, todas las DBs):

```bash
pg_dumpall -U postgres > full_backup.sql
```

---

## 4. Consejos de Seguridad
1. **Automatización**: Programa los backups con herramientas como `cron` (Linux) o el programador de tareas (Windows).
2. **Fuera de sitio**: Nunca guardes los backups solo en el mismo servidor donde está la base de datos.
3. **Pruebas**: Un backup que no se ha probado restaurar no es un backup confiable.
4. **pgAdmin**: También puedes hacer esto desde el entorno gráfico haciendo clic derecho sobre la base de datos -> **Backup** o **Restore**.
