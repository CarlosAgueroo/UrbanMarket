-- ======================================================
-- BASE DE DATOS: diodev_minimarlet
-- PROYECTO: Urban Minimarket - Sistema de Ventas
-- ======================================================

USE `diodev_minimarlet`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- ----------------------------
-- Tabla: categorias
-- ----------------------------
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Tabla: usuarios
-- ----------------------------
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(150) NOT NULL UNIQUE,
  `contrasena` VARCHAR(255) NOT NULL,
  `rol` ENUM('Administrador','Cliente') NOT NULL DEFAULT 'Cliente',
  `fecha_registro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Tabla: productos
-- ----------------------------
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(150) NOT NULL,
  `descripcion` TEXT,
  `precio` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `stock` INT(11) NOT NULL DEFAULT 0,
  `stock_minimo` INT(11) NOT NULL DEFAULT 5,
  `sexo` ENUM('Masculino','Femenino','Unisex') NOT NULL DEFAULT 'Unisex',
  `id_categoria` INT(11) NOT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Tabla: pedidos (ventas)
-- ----------------------------
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` INT(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(11) NOT NULL,
  `fecha_pedido` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `subtotal` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `igv` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `total` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `estado` ENUM('Pendiente','Completado','Cancelado') NOT NULL DEFAULT 'Completado',
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedido_usuario` (`id_usuario`),
  CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Tabla: detalle_pedidos
-- ----------------------------
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id_detalle` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` INT(11) NOT NULL,
  `id_producto` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL DEFAULT 1,
  `precio_unitario` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_detalle`),
  INDEX `fk_detalle_pedido` (`id_pedido`),
  INDEX `fk_detalle_producto` (`id_producto`),
  CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;

-- ----------------------------
-- Datos iniciales: Categorias
-- ----------------------------
INSERT INTO `categorias` (`nombre_categoria`) VALUES
('Bebidas'),
('Abarrotes'),
('Lácteos'),
('Snacks'),
('Higiene'),
('Limpieza');

-- ----------------------------
-- Datos iniciales: Usuarios (admin por defecto)
-- Contraseña: admin123 (en texto plano ya que el sistema no usa cifrado aún)
-- ----------------------------
INSERT INTO `usuarios` (`nombre_usuario`, `correo`, `contrasena`, `rol`) VALUES
('Administrador', 'admin@urbanminimarket.com', 'admin123', 'Administrador'),
('Cliente Demo', 'cliente@urbanminimarket.com', 'cliente123', 'Cliente');

-- ----------------------------
-- Datos iniciales: Productos de ejemplo
-- ----------------------------
INSERT INTO `productos` (`nombre_producto`, `descripcion`, `precio`, `stock`, `stock_minimo`, `sexo`, `id_categoria`) VALUES
('Inka Kola 1.5L', 'Gaseosa sabor original', 8.50, 50, 10, 'Unisex', 1),
('Arroz Costeño 5kg', 'Arroz extra', 20.00, 30, 5, 'Unisex', 2),
('Leche Gloria Evaporada', 'Lata grande', 4.20, 100, 20, 'Unisex', 3),
('Papas Lays Clásicas', 'Snack familiar', 5.50, 40, 10, 'Unisex', 4),
('Jabón Neko', 'Jabón antibacterial', 3.00, 60, 15, 'Unisex', 5),
('Detergente Ariel 1kg', 'Detergente en polvo', 12.00, 25, 5, 'Unisex', 6),
('Agua Cielo 2.5L', 'Agua sin gas', 3.50, 60, 20, 'Unisex', 1),
('Fideos Anita 500g', 'Fideos tallarin', 2.80, 80, 15, 'Unisex', 2),
('Yogurt Gloria Fresa 1L', 'Yogurt bebible', 6.50, 25, 5, 'Unisex', 3),
('Cheetos Queso', 'Snack frito', 4.00, 50, 10, 'Unisex', 4);
