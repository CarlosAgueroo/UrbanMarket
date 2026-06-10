<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nosotros - Urban Minimarket</title>
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
        <hr>
        <!-- Contenido Principal -->
        <main class="container my-5">
            <h1 class="text-center text-success mb-5">Sobre Nosotros</h1>

            <div class="row g-4">
                <!-- Misión -->
                <div class="col-md-4">
                    <div class="card h-100 shadow">
                        <div class="card-body text-center">
                            <span class="material-icons text-success" style="font-size: 48px;">flag</span>
                            <h3 class="card-title text-success mt-3">Misión</h3>
                            <p class="card-text">
                                Proveer a nuestros clientes con productos de primera necesidad, abarrotes y artículos diarios de la más alta calidad, garantizando un servicio rápido, amigable y confiable en su vecindario.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Visión -->
                <div class="col-md-4">
                    <div class="card h-100 shadow">
                        <div class="card-body text-center">
                            <span class="material-icons text-success" style="font-size: 48px;">visibility</span>
                            <h3 class="card-title text-success mt-3">Visión</h3>
                            <p class="card-text">
                                Ser el minimarket de referencia en nuestra comunidad y expandir nuestra red comercial, destacando por nuestro amplio surtido, los precios competitivos y nuestra excelente atención enfocada en la familia.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Qué Hacemos -->
                <div class="col-md-4">
                    <div class="card h-100 shadow">
                        <div class="card-body text-center">
                            <span class="material-icons text-success" style="font-size: 48px;">build</span>
                            <h3 class="card-title text-success mt-3">Qué Hacemos</h3>
                            <p class="card-text">
                                Ofrecemos una amplia variedad de productos de consumo diario. Desde lácteos, bebidas y abarrotes, hasta artículos de higiene personal y limpieza, todo organizado en un ambiente limpio, seguro y accesible.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
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
