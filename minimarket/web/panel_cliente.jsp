<%@ page import="DAO.ProductoDAO" %>
<%@ page import="Clases.Producto" %>
<%@ page import="Clases.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Clases.DetallePedido" %>
<%@ page import="Clases.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ProductoDAO productoDAO = new ProductoDAO();
    List<Producto> productos = productoDAO.obtenerTodos();

    List<DetallePedido> carrito = (List<DetallePedido>) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<DetallePedido>();
        session.setAttribute("carrito", carrito);
    }

    double subTotal = 0.0;
    for (DetallePedido detalle : carrito) {
        subTotal += detalle.getSubtotal();
    }
    double igv = subTotal * 0.18;
    double total = subTotal + igv;

    String mensajeConfirmacion = (String) session.getAttribute("mensajeConfirmacion");
    String mensajeError = (String) session.getAttribute("mensajeError");

    if (mensajeConfirmacion != null) {
        session.removeAttribute("mensajeConfirmacion");
    }
    if (mensajeError != null) {
        session.removeAttribute("mensajeError");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Cliente - Urban Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        :root { --green: #2e7d32; --green-dark: #1b5e20; --accent: #ff8f00; }
        * { font-family: 'Inter', sans-serif; }
        .navbar { background: linear-gradient(90deg, var(--green-dark), var(--green)) !important; }
        .btn-green { background: var(--green); color: #fff; border: none; }
        .btn-green:hover { background: var(--green-dark); color: #fff; }
        .text-green { color: var(--green-dark) !important; }
        .table thead th { background: #e8f5e9; color: var(--green-dark); }
        .badge-stock-low { background:#fff3cd;color:#856404;border:1px solid #ffc107;padding:3px 8px;border-radius:20px;font-size:.75rem; }
    </style>
</head>
<body class="bg-light">
    <!-- Barra de Navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="index.jsp">
                <span class="material-icons" style="color:var(--accent);font-size:28px">storefront</span>
                <span style="font-weight:800">Urban Market</span>
                <span style="background:var(--accent);color:#fff;font-size:.6rem;padding:2px 6px;border-radius:4px;font-weight:700">SGI-Urban</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link text-white" href="index.jsp"><span class="material-icons align-middle" style="font-size:18px">home</span> Inicio</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="Nosotros.jsp"><span class="material-icons align-middle" style="font-size:18px">info</span> Nosotros</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenido Principal -->
    <main class="container my-5">
        <h1 class="text-center text-green">🛒 Bienvenido, <%= usuario.getNombreUsuario() %></h1>
        <p class="text-center text-muted">Selecciona los productos y realiza tu compra</p>

        <!-- Mensajes -->
        <% if (mensajeConfirmacion != null) { %>
            <div class="alert alert-success" role="alert">
                <%= mensajeConfirmacion %>
            </div>
        <% } %>
        <% if (mensajeError != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= mensajeError %>
            </div>
        <% } %>

        <!-- Lista de Productos -->
        <h2 class="text-center my-4 text-green"><span class="material-icons align-middle">inventory_2</span> Catálogo de Productos</h2>
        <div class="table-responsive">
            <table class="table table-bordered text-center">
                <thead class="table-success">
                    <tr>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Sexo</th>
                        <th>Categoría</th>
                        <th>Cantidad</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Producto producto : productos) { %>
                        <tr>
                            <td><%= producto.getNombreProducto() %></td>
                            <td><%= producto.getDescripcion() %></td>
                            <td>S/ <%= String.format("%.2f", producto.getPrecio()) %></td>
                            <td><%= producto.getStock() %></td>
                            <td><%= producto.getSexo() %></td>
                            <td><%= producto.getCategoria().getNombreCategoria() %></td>
                            <td>
                                <form action="AgregarAlCarritoServlet" method="post">
                                    <input type="hidden" name="idProducto" value="<%= producto.getIdProducto() %>">
                                    <input type="number" name="cantidad" min="1" max="<%= producto.getStock() %>" value="1" class="form-control" required>
                            </td>
                            <td>
                                    <button type="submit" class="btn btn-green btn-sm"><span class="material-icons">add_shopping_cart</span> Agregar</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Carrito de Compras -->
        <h2 class="text-center my-4 text-green"><span class="material-icons align-middle">shopping_cart</span> Carrito de Compras</h2>
        <% if (carrito.isEmpty()) { %>
            <p class="text-center text-muted">Tu carrito está vacío.</p>
        <% } else { %>
            <form action="RealizarPedidoServlet" method="post">
                <div class="table-responsive">
                    <table class="table table-bordered text-center">
                        <thead class="table-danger">
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Subtotal</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (DetallePedido detalle : carrito) {
                                Producto prod = detalle.getProducto();
                            %>
                                <tr>
                                    <td><%= prod.getNombreProducto() %></td>
                                    <td><%= detalle.getCantidad() %></td>
                                    <td>S/ <%= String.format("%.2f", prod.getPrecio()) %></td>
                                    <td>S/ <%= String.format("%.2f", detalle.getSubtotal()) %></td>
                                    <td>
                                        <form action="QuitarDelCarritoServlet" method="post">
                                            <input type="hidden" name="idProducto" value="<%= prod.getIdProducto() %>">
                                            <button type="submit" class="btn btn-outline-danger btn-sm"><span class="material-icons">remove_shopping_cart</span> Quitar</button>
                                        </form>
                                    </td>
                                </tr>
                            <% } %>
                            <tr>
                                <td colspan="3" class="text-end"><strong>IGV (18%)</strong></td>
                                <td colspan="2">S/ <%= String.format("%.2f", igv) %></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="text-end"><strong>Total</strong></td>
                                <td colspan="2"><strong style="color:var(--green-dark)">S/ <%= String.format("%.2f", total) %></strong></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <button type="submit" class="btn btn-green w-100 py-3" style="font-weight:700;font-size:1.05rem;border-radius:12px"><span class="material-icons align-middle">check_circle</span> Confirmar Compra</button>
            </form>
        <% } %>

        <!-- Cerrar Sesión -->
        <div class="text-center mt-4">
            <form action="LogoutServlet" method="get">
                <button type="submit" class="btn btn-outline-secondary"><span class="material-icons align-middle">logout</span> Cerrar Sesión</button>
            </form>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4 mt-auto">
        <div class="container">
            <p class="mb-0">&copy; 2026 Urban Market — SGI-Urban. Sistema de Gestión de Inventario y Ventas.</p>
            <h5 style="color:var(--accent)">Encuéntranos aquí</h5>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.091058038045!2d-122.41941568468177!3d37.77492927975925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80858064d6ea4d15%3A0x5f1345926b5b34e5!2sSan%20Francisco%2C%20California%2C%20EE.%20UU.!5e0!3m2!1ses-419!2spe!4v1697665950233!5m2!1ses-419!2spe" 
                width="100%" 
                height="300" 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy"></iframe>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
