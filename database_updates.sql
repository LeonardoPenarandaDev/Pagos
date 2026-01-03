-- Script SQL para agregar nuevas tablas al sistema de pagos
-- Ejecutar este script en la base de datos 'pagos'

-- Tabla de pagos misceláneos (ingresos adicionales)
CREATE TABLE `miscellaneous_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `concept` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `remarks` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla de profesores
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_no` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `contact` varchar(100),
  `address` text,
  `email` varchar(200),
  `salary` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla de pagos a profesores (gastos)
CREATE TABLE `teacher_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `amount` float NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `remarks` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla de gastos generales
CREATE TABLE `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `concept` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `category` varchar(100),
  `remarks` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
