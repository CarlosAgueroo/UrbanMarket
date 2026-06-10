<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Urban Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar { background-color: #1a7a3c !important; }
        .login-wrapper { flex: 1; display: flex; align-items: center; justify-content: center; padding: 40px 16px; }
        .login-card {
            background: white;
            border-radius: 6px;
            padding: 36px 32px;
            width: 100%;
            max-width: 400px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .login-logo { text-align: center; margin-bottom: 24px; }
        .login-logo .material-icons { font-size: 48px; color: #1a7a3c; }
        .login-logo h4 { font-weight: bold; color: #1a7a3c; margin: 6px 0 2px; font-size: 1.3rem; }
        .login-logo small { color: #888; font-size: 0.8rem; }
        .form-label { font-weight: bold; font-size: 0.9rem; color: #333; }
        .form-control { border-radius: 4px; border: 1px solid #ccc; padding: 10px 12px; }
        .form-control:focus { border-color: #1a7a3c; box-shadow: 0 0 0 2px rgba(26,122,60,0.2); }
        .btn-login { background-color: #1a7a3c; color: white; border: none; width: 100%; padding: 11px; font-weight: bold; border-radius: 4px; font-size: 1rem; }
        .btn-login:hover { background-color: #145f2e; color: white; }
        .divider { text-align: center; color: #aaa; font-size: 0.85rem; margin: 16px 0; position: relative; }
        .divider::before { content:''; position:absolute; top:50%; left:0; right:0; height:1px; background:#e0e0e0; }
        .divider span { background:white; padding: 0 10px; position:relative; }
        .alert-error { background:#fdecea; border:1px solid #f5b8b8; color:#c0392b;border-radius:4px;padding:10px 14px;font-size:0.9rem;margin-bottom:16px; }
        footer { background-color: #222; color: #aaa; text-align: center; padding: 16px; font-size: 0.8rem; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="index.jsp">
                <span class="material-icons">storefront</span>
                Urban Market
            </a>
            <div class="d-flex gap-3">
                <a class="nav-link text-white" href="index.jsp">Inicio</a>
                <a class="nav-link text-white" href="Nosotros.jsp">Nosotros</a>
            </div>
        </div>
    </nav>

    <div class="login-wrapper">
        <div class="login-card">
            <div class="login-logo">
                <span class="material-icons">storefront</span>
                <h4>Urban Market</h4>
            </div>

            <%
                String error = request.getParameter("error");
                if ("true".equals(error)) {
            %>
            <div class="alert-error">
                <span class="material-icons align-middle" style="font-size:16px">error</span>
                Correo o contraseña incorrectos. Intente nuevamente.
            </div>
            <% } %>

            <form action="LoginServlet" method="POST">
                <div class="mb-3">
                    <label for="correo" class="form-label">Correo Electrónico</label>
                    <input type="email" id="correo" name="correo" class="form-control" placeholder="correo@ejemplo.com" required autofocus>
                </div>
                <div class="mb-3">
                    <label for="contrasena" class="form-label">Contraseña</label>
                    <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="••••••••" required>
                </div>
                <button type="submit" class="btn btn-login">
                    <span class="material-icons align-middle" style="font-size:18px">login</span>
                    Iniciar Sesión
                </button>
            </form>

            <div class="divider mt-3"><span>¿No tienes cuenta?</span></div>
            <a href="registro.jsp" class="btn btn-outline-secondary w-100" style="border-radius:4px;font-size:0.9rem;">
                Regístrate aquí
            </a>

        </div>
    </div>

    <footer>&copy; 2026 Urban Market. Todos los derechos reservados.</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
