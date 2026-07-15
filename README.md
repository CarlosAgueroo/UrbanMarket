Urban Minimarket
Urban Minimarket es un sistema integral de comercio electrónico y gestión de inventario para un minimarket moderno. El proyecto ha sido desarrollado bajo un modelo de arquitectura monolítica en Java (Servlets y JSP) conectado de manera nativa mediante JDBC a una base de datos MySQL desplegada en la nube.
La interfaz de usuario ha sido rediseñada utilizando Bootstrap 5 y Material Icons, implementando una identidad corporativa de color verde dinámico con catálogos categorizados y scroll interactivo.
---
Tecnologías Principales
Backend: Java (Servlets, JSP)
Base de Datos: MySQL (En la nube)
Servidor Web: Apache Tomcat 9.x
Frontend: HTML5, CSS3, JavaScript, Bootstrap 5
---
Guía Rápida de Instalación
Este proyecto ha sido estructurado para ser "Plug and Play" en cualquier equipo moderno. Puesto que la Base de Datos (basedatos_urbanmarket`) ya está viva en la red, no requieres configurar XAMPP ni MySQL en tu máquina local.
Requisitos Previos:
Tener instalado el Java Development Kit (JDK 8 o superior).
Contar con una carpeta funcional del servidor Apache Tomcat 9.x.
Pasos para el Despliegue:
Toma el archivo comprimido final del proyecto: `UrbanMinimarket.war`.
Pega este archivo `.war` dentro de la subcarpeta `webapps` que se encuentra en la ruta de tu Apache Tomcat (Ej: `apache-tomcat-9.0.x/webapps/`).
Inicia el servidor ejecutando el script `startup.bat` (Windows) o `startup.sh` (Mac/Linux) ubicado en la carpeta `bin/` de Tomcat.
El servidor desempaquetará el proyecto de manera automática.
Accede al entorno visitando la dirección en cualquier navegador:
http://localhost:8080/UrbanMinimarket/
---
Credenciales de Prueba
La base de datos en la nube está inicializada con dos perfiles fijos de prueba que puedes utilizar en la ruta de Login:
Administrador del Sistema:
Correo: `admin@gmail.com.com`
Contraseña: `admin123`
(Permite la gestión total de inventarios, pedidos y clientes).
Cliente Frecuente:
Correo: `cliente@gmail.com`
Contraseña: `cliente123`
(Permite la previsualización del flujo de carrito e información estandar).
---
Desarrollado para el sistema de control de ventas SGI-Urban (2026).
