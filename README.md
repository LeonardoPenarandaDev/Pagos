# 💰 Sistema de Gestión de Pagos - EMUNAHED

Sistema integral de gestión de pagos para institución educativa desarrollado en PHP. Permite administrar pagos de estudiantes, profesores, gastos institucionales y generar reportes financieros completos.

![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Módulos del Sistema](#-módulos-del-sistema)
- [Requisitos](#-requisitos)
- [Instalación](#-instalación)
- [Configuración](#-configuración)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Uso](#-uso)
- [Base de Datos](#-base-de-datos)
- [Seguridad](#-seguridad)
- [Contribuir](#-contribuir)
- [Licencia](#-licencia)

## ✨ Características

### Gestión Académica
- 📚 **Gestión de Cursos**: Administración de cursos desde Pre-Jardín hasta Grado 11 y Bachillerato por Ciclos
- 👨‍🎓 **Gestión de Estudiantes**: Registro completo de estudiantes con información de contacto
- 👨‍🏫 **Gestión de Profesores**: Administración de personal docente
- 📜 **Certificados de Estudio**: Generación automática de certificados para estudiantes

### Gestión Financiera
- 💵 **Pagos de Matrícula**: Control de matrículas y mensualidades
- 💰 **Pagos Misceláneos**: Registro de pagos adicionales (uniformes, materiales, etc.)
- 💸 **Pagos a Profesores**: Gestión de nómina docente
- 📊 **Dashboard Financiero**: Visualización de ingresos, egresos y balance
- 📈 **Reportes de Pagos**: Generación de reportes detallados por período

### Administración
- 👥 **Sistema de Usuarios**: Gestión de usuarios con diferentes niveles de acceso
- 🧾 **Generación de Recibos**: Recibos automáticos para todos los tipos de pago
- 📝 **Control de Gastos**: Registro y seguimiento de gastos institucionales
- 📋 **Registro de Actividades**: Log de todas las operaciones del sistema
- ⚙️ **Configuración del Sistema**: Personalización de datos institucionales

## 🎯 Módulos del Sistema

### 1. Módulo de Estudiantes
- Registro de estudiantes con número de identificación único
- Asignación a cursos y niveles
- Historial completo de pagos
- Generación de certificados de estudio

### 2. Módulo de Profesores
- Registro de docentes
- Control de pagos y honorarios
- Generación de recibos de pago

### 3. Módulo de Pagos
- **Pagos de Estudiantes**: Matrículas y mensualidades
- **Pagos Misceláneos**: Conceptos adicionales
- **Pagos a Profesores**: Nómina docente
- Registro de fecha, monto y observaciones

### 4. Módulo Financiero
- Dashboard con métricas en tiempo real
- Reportes de ingresos y egresos
- Balance financiero
- Gráficos y estadísticas

### 5. Módulo de Administración
- Gestión de usuarios y permisos
- Configuración institucional
- Logs del sistema
- Respaldos de información

## 🔧 Requisitos

### Requisitos del Servidor
- **PHP**: >= 7.4
- **MySQL**: >= 5.7 o MariaDB >= 10.2
- **Apache/Nginx**: Servidor web con mod_rewrite habilitado
- **Extensiones PHP requeridas**:
  - mysqli
  - session
  - json
  - mbstring

### Requisitos del Cliente
- Navegador web moderno (Chrome, Firefox, Safari, Edge)
- JavaScript habilitado
- Resolución mínima: 1024x768

## 📦 Instalación

### 1. Clonar el Repositorio

```bash
git clone https://github.com/LeonardoPenarandaDev/Pagos.git
cd Pagos
```

### 2. Configurar el Servidor Web

#### Para Apache (XAMPP/WAMP/Laragon)
```apache
<VirtualHost *:80>
    DocumentRoot "C:/ruta/al/proyecto/Pagos"
    ServerName pagos.local
    <Directory "C:/ruta/al/proyecto/Pagos">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

#### Para Nginx
```nginx
server {
    listen 80;
    server_name pagos.local;
    root /ruta/al/proyecto/Pagos;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
    }
}
```

### 3. Importar la Base de Datos

```bash
# Acceder a MySQL
mysql -u root -p

# Crear la base de datos
CREATE DATABASE emunahed_pagos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# Importar el esquema
mysql -u root -p emunahed_pagos < emunahed_pagos.sql
```

### 4. Configurar la Conexión a la Base de Datos

Crear el archivo `db_connect.php` en la raíz del proyecto:

```php
<?php
$host = 'localhost';
$username = 'tu_usuario';
$password = 'tu_contraseña';
$database = 'emunahed_pagos';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");
?>
```

### 5. Configurar Permisos (Linux/Mac)

```bash
chmod 755 -R .
chmod 644 db_connect.php
```

## ⚙️ Configuración

### Credenciales por Defecto

Después de la instalación, puedes acceder con:

- **Usuario**: admin
- **Contraseña**: admin123

> ⚠️ **Importante**: Cambia estas credenciales inmediatamente después del primer inicio de sesión.

### Configuración del Sistema

1. Accede a **Configuración del Sistema** desde el menú
2. Actualiza los datos de la institución:
   - Nombre de la institución
   - Email de contacto
   - Teléfono
   - Dirección
   - Logo institucional

## 📁 Estructura del Proyecto

```
Pagos/
├── assets/                    # Recursos estáticos
│   ├── css/                  # Hojas de estilo
│   ├── js/                   # Scripts JavaScript
│   ├── img/                  # Imágenes
│   └── vendor/               # Librerías de terceros
│       ├── bootstrap/        # Framework CSS
│       ├── jquery/           # Librería JavaScript
│       ├── boxicons/         # Iconos
│       └── ...
├── admin_class.php           # Clase principal de administración
├── ajax.php                  # Manejador de peticiones AJAX
├── db_connect.php           # Configuración de base de datos (no incluido)
├── header.php               # Encabezado común
├── navbar.php               # Barra de navegación
├── footer.php               # Pie de página
├── index.php                # Página de inicio
├── login.php                # Sistema de autenticación
│
├── students.php             # Gestión de estudiantes
├── manage_student.php       # Formulario de estudiantes
├── teachers.php             # Gestión de profesores
├── manage_teacher.php       # Formulario de profesores
├── courses.php              # Gestión de cursos
├── manage_course.php        # Formulario de cursos
│
├── payments.php             # Pagos de estudiantes
├── manage_payment.php       # Formulario de pagos
├── receipt.php              # Generación de recibos
├── misc_payments.php        # Pagos misceláneos
├── misc_receipt.php         # Recibos misceláneos
├── teacher_payments.php     # Pagos a profesores
├── teacher_payment_receipt.php  # Recibos de profesores
│
├── expenses.php             # Gestión de gastos
├── manage_expense.php       # Formulario de gastos
├── financial_dashboard.php  # Dashboard financiero
├── payments_report.php      # Reportes de pagos
│
├── student_certificate.php  # Generación de certificados
├── users.php                # Gestión de usuarios
├── manage_user.php          # Formulario de usuarios
├── site_settings.php        # Configuración del sistema
├── logs.php                 # Registro de actividades
│
├── emunahed_pagos.sql      # Esquema de base de datos
├── database_updates.sql     # Actualizaciones de BD
├── .gitignore              # Archivos ignorados por Git
└── README.md               # Este archivo
```

## 🚀 Uso

### Flujo de Trabajo Típico

#### 1. Configuración Inicial
1. Crear cursos y definir tarifas
2. Registrar profesores
3. Crear usuarios del sistema

#### 2. Gestión de Estudiantes
1. Ir a **Estudiantes** → **Nuevo Estudiante**
2. Completar información del estudiante
3. Asignar curso y nivel
4. Definir tarifa total

#### 3. Registro de Pagos
1. Ir a **Pagos** → **Nuevo Pago**
2. Seleccionar estudiante
3. Ingresar monto y concepto
4. Generar recibo automático

#### 4. Pagos a Profesores
1. Ir a **Pagos a Profesores**
2. Seleccionar profesor
3. Registrar pago y concepto
4. Generar recibo

#### 5. Control de Gastos
1. Ir a **Gastos** → **Nuevo Gasto**
2. Registrar concepto y monto
3. Adjuntar observaciones

#### 6. Reportes
1. Acceder a **Dashboard Financiero**
2. Seleccionar período de consulta
3. Generar reportes de ingresos/egresos
4. Exportar o imprimir

## 🗄️ Base de Datos

### Tablas Principales

- **`users`**: Usuarios del sistema
- **`system_settings`**: Configuración institucional
- **`courses`**: Cursos y niveles académicos
- **`fees`**: Tarifas por curso
- **`student`**: Información de estudiantes
- **`student_ef_list`**: Asignación estudiante-curso
- **`payments`**: Pagos de estudiantes
- **`teachers`**: Información de profesores
- **`teacher_payments`**: Pagos a profesores
- **`miscellaneous_payments`**: Pagos misceláneos
- **`expenses`**: Gastos institucionales

### Diagrama de Relaciones

```
courses (1) ----< (N) fees
courses (1) ----< (N) student_ef_list
student (1) ----< (N) student_ef_list
student_ef_list (1) ----< (N) payments
teachers (1) ----< (N) teacher_payments
student (1) ----< (N) miscellaneous_payments
```

## 🔒 Seguridad

### Medidas Implementadas

- ✅ Autenticación de usuarios con contraseñas encriptadas (MD5)
- ✅ Sesiones PHP para control de acceso
- ✅ Validación de datos en servidor
- ✅ Protección contra inyección SQL mediante prepared statements
- ✅ Archivos sensibles excluidos del repositorio (.gitignore)

### Recomendaciones Adicionales

> ⚠️ **Importante para Producción**:

1. **Actualizar el método de encriptación**: Cambiar de MD5 a `password_hash()` de PHP
2. **Usar HTTPS**: Implementar certificado SSL/TLS
3. **Configurar permisos**: Restringir acceso a archivos sensibles
4. **Backups regulares**: Programar respaldos automáticos de la base de datos
5. **Actualizar dependencias**: Mantener PHP y MySQL actualizados
6. **Variables de entorno**: Usar archivos `.env` para credenciales

### Archivos Excluidos del Repositorio

Por seguridad, los siguientes archivos NO están incluidos en el repositorio:

- `db_connect.php` - Credenciales de base de datos
- `error_log` - Logs de errores del servidor
- Archivos de configuración local

Debes crear estos archivos manualmente siguiendo las instrucciones de instalación.

## 📊 Características Técnicas

### Frontend
- **Bootstrap 4.5**: Framework CSS responsive
- **jQuery 3.6**: Manipulación del DOM y AJAX
- **Bootstrap Datepicker**: Selector de fechas
- **Boxicons**: Iconografía
- **Owl Carousel**: Carruseles (si aplica)

### Backend
- **PHP 7.4+**: Lenguaje del servidor
- **MySQLi**: Conexión a base de datos
- **Sesiones PHP**: Manejo de autenticación
- **AJAX**: Comunicación asíncrona

### Funcionalidades AJAX
- Guardado de registros sin recargar página
- Validación en tiempo real
- Carga dinámica de datos
- Actualización de dashboard

## 🤝 Contribuir

Las contribuciones son bienvenidas. Para contribuir:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

### Guías de Contribución

- Sigue las convenciones de código existentes
- Documenta nuevas funcionalidades
- Prueba exhaustivamente antes de enviar PR
- Actualiza el README si es necesario

## 📝 Changelog

### Versión 2.0 (Enero 2026)
- ✨ Agregado sistema de certificados de estudio
- ✨ Implementado dashboard financiero
- ✨ Agregados pagos a profesores
- ✨ Implementados pagos misceláneos
- ✨ Sistema de gastos institucionales
- 🐛 Correcciones menores de bugs

### Versión 1.0 (Febrero 2024)
- 🎉 Lanzamiento inicial
- ✨ Gestión de estudiantes y cursos
- ✨ Sistema de pagos básico
- ✨ Generación de recibos

## 📞 Soporte

Para reportar bugs o solicitar nuevas características, por favor abre un [issue](https://github.com/LeonardoPenarandaDev/Pagos/issues) en GitHub.

## 👨‍💻 Autor

**Leonardo Alexander Peñaranda Angarita**
- GitHub: [@LeonardoPenarandaDev](https://github.com/LeonardoPenarandaDev)
- Email: codemaster2070@gmail.com

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

---

⭐ Si este proyecto te ha sido útil, considera darle una estrella en GitHub!

**Desarrollado con ❤️ para EMUNAHED**
