-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Rodrigo
-- Fecha: 2026-09-18
-- ══════════════════════════════════════════

-- ── SECCIÓN DDL ──────────────────────────
-- Elimino la tabla si ya existe para evitar errores al re-ejecutar
DROP TABLE IF EXISTS inventario;

-- Creo la tabla inventario con las columnas solicitadas
CREATE TABLE inventario (
    id_producto     INT PRIMARY KEY,              -- INT: identificador único, clave primaria
    nombre_producto VARCHAR(100) NOT NULL,        -- VARCHAR(100): suficiente para nombres largos
    categoria       VARCHAR(50) NOT NULL,         -- VARCHAR(50): categorías cortas y descriptivas
    precio_unitario DECIMAL(10,2) NOT NULL,       -- DECIMAL(10,2): evita imprecisiones en valores monetarios
    stock_actual    INT NOT NULL,                 -- INT: cantidad de unidades disponibles
    stock_minimo    INT NOT NULL,                 -- INT: umbral mínimo de reposición
    fecha_ingreso   DATE NOT NULL,                -- DATE: fecha exacta de ingreso
    activo          TINYINT(1) DEFAULT 1          -- 1 = disponible, 0 = descontinuado
);

-- ── SECCIÓN DML ──────────────────────────
-- Inserto los 10 productos iniciales
INSERT INTO inventario VALUES
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- ── Actualización de ventas del día ──────
-- Laptop Pro 15: vendidas 3 unidades → stock final = 12
UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Mouse Inalámbrico: vendidas 12 unidades → stock final = 68
UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Auriculares BT Pro: vendidas 5 unidades → stock final = 30
UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

-- ── Producto descontinuado ───────────────
-- Webcam HD 1080p → activo = 0
UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

-- ── Validación ───────────────────────────
-- Ver la tabla completa para confirmar que los datos se cargaron y actualizaron
SELECT * FROM inventario;
