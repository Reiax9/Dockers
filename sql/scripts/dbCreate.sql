DROP DATABASE IF EXISTS `krasty`;
CREATE DATABASE IF NOT EXISTS `krasty`;

CREATE USER 'admin'@'%' IDENTIFIED BY 'Где';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';


USE `krasty`;

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes`(
    `id` INT AUTO_INCREMENT NOT NULL,
    `user` VARCHAR(64) NOT NULL,
    `apellido` VARCHAR(128) NOT NULL,
    `pass` VARCHAR(128) NOT NULL,
    `telefono` NUMERIC(9),
    `dni` CHAR(9) unique NOT NULL,
    `calle` VARCHAR(264),
    PRIMARY KEY(`id`) 
);

DROP TABLE IF EXISTS `trabajadores`;
CREATE TABLE IF NOT EXISTS `trabajadores`(
    `id` INT AUTO_INCREMENT NOT NULL,
    `user` VARCHAR(64) NOT NULL,
    `pass` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`) 
);

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
    `id_venta` INT AUTO_INCREMENT NOT NULL,
    `id_usuario` INT NOT NULL,
    `fecha_venta` DATE NOT NULL,
    `monto_total` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`id_venta`)
);

DROP TABLE IF EXISTS `detalles_ventas`;
CREATE TABLE IF NOT EXISTS `detalles_ventas` (
    `id_detalle_venta` INT AUTO_INCREMENT NOT NULL,
    `id_venta` INT NOT NULL,
    `id_producto` INT NOT NULL,
    `cantidad` INT NOT NULL,
    `precio_unitario` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`id_detalle_venta`)
);

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
    `id_compra` INT AUTO_INCREMENT NOT NULL,
    `id_proveedor` INT NOT NULL,
    `fecha_compra` DATE NOT NULL,
    `monto_total` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`id_compra`)
);

DROP TABLE IF EXISTS `detalles_compras`;
CREATE TABLE IF NOT EXISTS `detalles_compras` (
    `id_detalle_compra` INT AUTO_INCREMENT NOT NULL,
    `id_compra` INT NOT NULL,
    `id_producto` INT NOT NULL,
    `cantidad` INT NOT NULL,
    `precio_unitario` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`id_detalle_compra`)
);

DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE IF NOT EXISTS `configuracion` (
    `id_configuracion` INT AUTO_INCREMENT NOT NULL,
    `nombre_parametro` VARCHAR(50) NOT NULL,
    `valor_parametro` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id_configuracion`)
);

-- Inserción de datos con contraseñas hasheadas y DNI con letra en mayúscula en la tabla users
INSERT INTO `clientes` (`user`, `apellido`, `pass`, `telefono`, `dni`, `calle`) VALUES
('jsmith', 'Smith', MD5('clave123'), 555123456, '12345678A', 'Calle Principal 123'),
('amiller', 'Miller', MD5('segura456'), 555987654, '98765432B', 'Avenida Central 456'),
('rjohnson', 'Johnson', MD5('miClave123'), 555111222, '11122233C', 'Calle Secundaria 789'),
('bwilliams', 'Williams', MD5('contraseña789'), 555222333, '22233344D', 'Calle Principal 567'),
('mthomas', 'Thomas', MD5('claveSegura321'), 555333444, '33344455E', 'Avenida Norte 890'),
('jrodriguez', 'Rodriguez', MD5('miContraseña'), 555444555, '44455566F', 'Calle del Sol 123'),
('gjones', 'Jones', MD5('123456pass'), 555555666, '55566677G', 'Avenida Oeste 456'),
('slee', 'Lee', MD5('claveLee789'), 555666777, '66677788H', 'Calle Este 789'),
('tkim', 'Kim', MD5('kim123pass'), 555777888, '77788899I', 'Avenida Sur 012'),
('mpatel', 'Patel', MD5('patelPass123'), 555888999, '88899900J', 'Calle Central 345'),
('jwilson', 'Wilson', MD5('claveWilson'), 555999000, '99900011K', 'Avenida Principal 678'),
('ksmith', 'Smith', MD5('smithPass123'), 555000111, '00011122L', 'Calle Norte 901'),
('ncarter', 'Carter', MD5('contraseñaCarter'), 555123000, '12300045M', 'Avenida Sur 234'),
('jjackson', 'Jackson', MD5('jacksonPass'), 555234111, '23411122N', 'Calle Este 567'),
('rhall', 'Hall', MD5('hall123clave'), 555345222, '34522233O', 'Avenida Oeste 890');

INSERT INTO `trabajadores` (`user`,`pass`) VALUES
('admin', MD5('adminadmin1979')),
('krast', MD5('kapinga')),
('reiax', MD5('alpingah17'));

-- Ventas
INSERT INTO `ventas` (`id_usuario`, `fecha_venta`, `monto_total`) VALUES
(1, '2023-11-01', 150.50),
(2, '2023-11-02', 200.75),
(3, '2023-11-03', 120.00);

-- Detalles de Ventas
INSERT INTO `detalles_ventas` (`id_venta`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(1, 101, 2, 25.50),
(1, 102, 1, 50.00),
(2, 103, 3, 30.25),
(3, 104, 2, 60.00);

-- Compras
INSERT INTO `compras` (`id_proveedor`, `fecha_compra`, `monto_total`) VALUES
(1, '2023-11-05', 500.00),
(2, '2023-11-07', 700.25),
(3, '2023-11-10', 900.50);

-- Detalles de Compras
INSERT INTO `detalles_compras` (`id_compra`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(1, 201, 5, 80.00),
(1, 202, 2, 120.50),
(2, 203, 3, 50.25),
(3, 204, 4, 90.25);

-- Configuración
INSERT INTO `configuracion` (`nombre_parametro`, `valor_parametro`) VALUES
('tasa_impuesto', '0.15'),
('limite_credito', '1000.00'),
('idioma_predeterminado', 'español');