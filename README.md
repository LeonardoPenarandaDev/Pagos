# Pagos

Sistema de gestión de pagos para institución educativa.

## Características

- Gestión de estudiantes y profesores
- Registro de pagos de matrícula y mensualidades
- Pagos misceláneos
- Pagos a profesores
- Generación de recibos y certificados
- Dashboard financiero
- Reportes de pagos
- Gestión de cursos y tarifas
- Control de gastos
- Sistema de usuarios y permisos

## Tecnologías

- PHP
- MySQL
- Bootstrap
- jQuery
- HTML/CSS

## Instalación

1. Clonar el repositorio
2. Importar la base de datos desde `emunahed_pagos.sql`
3. Configurar la conexión a la base de datos en `db_connect.php`
4. Acceder al sistema a través del navegador

## Seguridad

**Importante**: El archivo `db_connect.php` contiene credenciales sensibles y no está incluido en el repositorio. Debes crear este archivo localmente con la siguiente estructura:

```php
<?php
// Configuración de conexión a la base de datos
$conn = new mysqli('localhost', 'usuario', 'contraseña', 'nombre_bd');
?>
```
