# Seguridad y Administración en PostgreSQL

PostgreSQL ofrece un robusto sistema de permisos y seguridad basado en roles para proteger la integridad y confidencialidad de los datos.

---

## 1. Gestión de Roles y Usuarios
En PostgreSQL, los usuarios y los grupos se manejan bajo el concepto unificado de **Roles**.

### Crear un Rol/Usuario
```sql
CREATE ROLE desarrollador WITH LOGIN PASSWORD 'secreto123';
```

### Dar Permisos (GRANT)
Permite que un rol realice ciertas acciones en objetos específicos.
```sql
GRANT SELECT, INSERT ON usuarios TO desarrollador;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO desarrollador;
```

### Quitar Permisos (REVOKE)
```sql
REVOKE INSERT ON usuarios FROM desarrollador;
```

---

## 2. RLS (Row Level Security)
Es una de las características más potentes de PostgreSQL. Permite que **un usuario solo vea las filas que le corresponden**, incluso si ejecuta `SELECT *`.

### Paso 1: Activar RLS en la tabla
```sql
ALTER TABLE pedidos ENABLE ROW LEVEL SECURITY;
```

### Paso 2: Crear una política
Solo permite que el usuario vea pedidos donde el `usuario_id` coincide con su propio ID de sesión.
```sql
CREATE POLICY policy_mis_pedidos ON pedidos
FOR SELECT
USING (usuario_id = current_user_id());
```

---

## 3. Esquemas (Schemas)
Los esquemas son como carpetas dentro de una base de datos. Sirven para organizar objetos y aplicar permisos de forma masiva.

### Crear un esquema
```sql
CREATE SCHEMA ventas;
```

### Mover una tabla a un esquema
```sql
ALTER TABLE pedidos SET SCHEMA ventas;
```

### Configurar el Search Path
Define en qué orden busca PostgreSQL los objetos cuando no especificas el esquema.
```sql
SET search_path TO ventas, public;
```

---

## 4. Auditoría y Logs
Es vital saber quién hizo qué y cuándo.

- **pg_stat_activity**: Vista para ver qué consultas están ocurriendo en tiempo real.
- **pg_stat_statements**: Extensión para registrar estadísticas de todas las consultas ejecutadas.

### Ver procesos actuales
```sql
SELECT * FROM pg_stat_activity WHERE state = 'active';
```
