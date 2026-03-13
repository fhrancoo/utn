/*
    Script de Práctica - DATABASE II
    Este script crea una base de datos de un "Sistema de Gestión de Pedidos"
    ideal para practicar: JOINs, EXISTS, CASE, Subconsultas, Triggers y PL/pgSQL.
*/

-- 1. LIMPIEZA (Opcional, para empezar de cero)
DROP TABLE IF EXISTS auditoria_precios CASCADE;
DROP TABLE IF EXISTS detalle_pedidos CASCADE;
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS productos CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;
DROP TYPE IF EXISTS estado_pedido;

-- 2. TIPOS PERSONALIZADOS
CREATE TYPE estado_pedido AS ENUM ('pendiente', 'procesado', 'enviado', 'entregado', 'cancelado');

-- 3. TABLAS (DDL)

-- Usuarios / Clientes
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    puntos INTEGER DEFAULT 0 CHECK (puntos >= 0),
    ciudad VARCHAR(50),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0),
    stock INTEGER NOT NULL DEFAULT 0
);

-- Pedidos (Cabecera)
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id) ON DELETE CASCADE,
    fecha TIMESTAMPTZ DEFAULT NOW(),
    estado estado_pedido DEFAULT 'pendiente',
    total NUMERIC(12, 2) DEFAULT 0
);

-- Detalle de Pedidos
CREATE TABLE detalle_pedidos (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER REFERENCES pedidos(id) ON DELETE CASCADE,
    producto_id INTEGER REFERENCES productos(id),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10, 2) NOT NULL
);

-- Tabla para Auditoría (Para practicar Triggers)
CREATE TABLE auditoria_precios (
    id SERIAL PRIMARY KEY,
    producto_id INTEGER,
    precio_anterior NUMERIC(10, 2),
    precio_nuevo NUMERIC(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. CARGA DE DATOS (DML)

INSERT INTO usuarios (nombre, email, puntos, ciudad) VALUES
('Juan Perez', 'juan@mail.com', 1200, 'Cordoba'),
('Ana Garcia', 'ana@mail.com', 450, 'Rosario'),
('Luis Lopez', 'luis@mail.com', 0, 'Cordoba'),
('Maria Rodriguez', 'maria@mail.com', 800, 'Mendoza'),
('Carlos Sanchez', 'carlos@mail.com', 1500, 'Buenos Aires'),
('Laura Martinez', 'laura@mail.com', 100, 'Cordoba');

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Laptop Pro', 'Electronica', 1500.00, 10),
('Mouse Inalambrico', 'Electronica', 25.50, 50),
('Teclado Mecanico', 'Electronica', 80.00, 20),
('Monitor 24"', 'Electronica', 300.00, 15),
('Silla Gamer', 'Muebles', 250.00, 5),
('Escritorio L', 'Muebles', 450.00, 3),
('Libro SQL Avanzado', 'Libros', 45.00, 100),
('Cafetera Express', 'Hogar', 120.00, 0); -- Sin stock para practicar

-- Insertar Pedidos
INSERT INTO pedidos (usuario_id, fecha, estado, total) VALUES
(1, '2024-01-10', 'entregado', 1525.50),
(1, '2024-02-15', 'procesado', 80.00),
(2, '2024-02-20', 'pendiente', 300.00),
(4, '2024-03-01', 'enviado', 450.00),
(5, '2024-03-05', 'entregado', 1500.00);

-- Insertar Detalles
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1500.00),
(1, 2, 1, 25.50),
(2, 3, 1, 80.00),
(3, 4, 1, 300.00),
(4, 6, 1, 450.00),
(5, 1, 1, 1500.00);

-- 5. EJEMPLOS DE CONSULTAS PARA CLASE

/* 
-- PRACTICA JOINs Y AGREGACION:
SELECT u.nombre, COUNT(p.id) as total_pedidos, SUM(p.total) as gasto_total
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.usuario_id
GROUP BY u.nombre;

-- PRACTICA EXISTS:
-- Usuarios que nunca compraron nada
SELECT nombre FROM usuarios u
WHERE NOT EXISTS (SELECT 1 FROM pedidos p WHERE p.usuario_id = u.id);

-- PRACTICA CASE:
SELECT nombre, puntos,
  CASE 
    WHEN puntos >= 1000 THEN 'Premium'
    WHEN puntos >= 500 THEN 'Gold'
    ELSE 'Regular'
  END as categoria_usuario
FROM usuarios;
*/

-- 6. LOGICA PROCEDIMENTAL (Para practicar PL/pgSQL)

-- Función para actualizar puntos automáticamente
CREATE OR REPLACE FUNCTION actualizar_puntos_usuario()
RETURNS TRIGGER AS $$
BEGIN
    -- Sumar 1 punto por cada 10 unidades de la moneda gastadas
    UPDATE usuarios 
    SET puntos = puntos + (NEW.total / 10)::INTEGER
    WHERE id = NEW.usuario_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_actualizar_puntos
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION actualizar_puntos_usuario();
