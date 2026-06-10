<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Cliente - Urban Minimarket</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="css/styles.css">
</head>
<body class="bg-light">
    <!-- Barra de Navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="index.jsp">
                <span class="material-icons">storefront</span> Urban Market
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link text-white" href="index.jsp"><span class="material-icons">home</span> Inicio</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="Nosotros.jsp"><span class="material-icons">info</span> Nosotros</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="login.jsp"><span class="material-icons">login</span> Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenido Principal -->
    <main class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-header text-center bg-success text-white">
                        <h3><span class="material-icons">person_add</span> Registro de Cliente</h3>
                    </div>
                    <div class="card-body">
                        <form action="RegistroServlet" method="POST">
                            <div class="mb-3">
                                <label for="nombre" class="form-label"><span class="material-icons">person</span> Nombre</label>
                                <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Escribe tu nombre completo" required>
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label"><span class="material-icons">email</span> Correo</label>
                                <input type="email" id="correo" name="correo" class="form-control" placeholder="Escribe tu correo" required>
                            </div>
                            <div class="mb-3">
                                <label for="contrasena" class="form-label"><span class="material-icons">lock</span> Contraseña</label>
                                <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Crea una contraseña segura" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success"><span class="material-icons">how_to_reg</span> Registrar</button>
                            </div>
                        </form>
                        <p class="mt-3 text-center">
                            ¿Ya tienes cuenta? <a href="login.jsp" class="text-success">Inicia sesión aquí</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Pie de Página -->
    <footer class="bg-dark text-white text-center py-4 mt-auto">
        <div class="container">
            <p class="mb-4">&copy; 2026 Urban Minimarket. Todos los derechos reservados.</p>
            <h5 class="text-success">Encuéntranos aquí</h5>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.091058038045!2d-122.41941568468177!3d37.77492927975925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80858064d6ea4d15%3A0x5f1345926b5b34e5!2sSan%20Francisco%2C%20California%2C%20EE.%20UU.!5e0!3m2!1ses-419!2spe!4v1697665950233!5m2!1ses-419!2spe" 
                width="100%" 
                height="300" 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy"></iframe>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
