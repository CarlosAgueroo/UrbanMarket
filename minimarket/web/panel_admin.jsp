<%@page import="Clases.Usuario"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page session="true"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || !"Administrador".equals(usuario.getRol())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Administrador - Urban Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f0f2f5; }
        .sidebar {
            width: 240px; min-height: 100vh;
            background-color: #1a7a3c;
            position: fixed; top: 0; left: 0; z-index: 100; padding-top: 0;
        }
        .sidebar .brand { color: #fff; font-size: 1.1rem; font-weight: bold; padding: 18px 20px; border-bottom: 1px solid rgba(255,255,255,0.2); display:flex; align-items:center; gap:8px; }
        .sidebar .nav-link { color: rgba(255,255,255,0.85); padding: 11px 20px; display: flex; align-items: center; gap: 10px; transition: background 0.15s; border-radius: 0; font-size:0.92rem; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { background: rgba(255,255,255,0.15); color: #fff; }
        .sidebar .nav-link .material-icons { font-size: 19px; }
        .sidebar hr { border-color: rgba(255,255,255,0.2); margin: 8px 0; }
        .main-content { margin-left: 240px; padding: 24px; background:#f5f5f5; min-height:100vh; }
        .topbar { background: #fff; border-radius: 4px; padding: 14px 20px; margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; border: 1px solid #e0e0e0; }
        .topbar h5 { font-weight: bold; margin:0; color:#222; }
        .topbar small { color:#888; }
        .kpi-card { background: #fff; border-radius: 4px; padding: 20px; border: 1px solid #e0e0e0; border-left: 4px solid; }
        .kpi-card.red { border-left-color: #e53935; }
        .kpi-card.blue { border-left-color: #1e88e5; }
        .kpi-card.green { border-left-color: #43a047; }
        .kpi-card.orange { border-left-color: #fb8c00; }
        .kpi-value { font-size: 1.8rem; font-weight: bold; color: #222; }
        .kpi-label { font-size: 0.82rem; color: #888; margin-top: 2px; }
        .section-card { background: #fff; border-radius: 4px; padding: 20px; border: 1px solid #e0e0e0; margin-bottom: 20px; display: none; }
        .section-card.active { display: block; }
        .section-card.dashboard-section { display: block; }
        .btn-primary-red { background: #1a7a3c; border-color: #1a7a3c; color: #fff; }
        .btn-primary-red:hover { background: #145f2e; border-color: #145f2e; color: #fff; }
        .badge-stock-low { background: #fff3cd; color: #856404; border: 1px solid #ffc107; padding: 3px 8px; border-radius: 3px; font-size: 0.75rem; }
        .badge-stock-ok { background: #e8f5e9; color: #2e7d32; border: 1px solid #a5d6a7; padding: 3px 8px; border-radius: 3px; font-size: 0.75rem; }
        table thead th { background: #f5f5f5; font-weight: bold; font-size: 0.83rem; color: #444; border-bottom: 2px solid #ddd; }
        .alert-stock { background: #fff8e1; border: 1px solid #ffe082; border-radius: 4px; padding: 14px; }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="brand">
        <span class="material-icons" style="vertical-align: middle;">storefront</span>
        Urban Market
    </div>
    <nav class="mt-3">
        <a class="nav-link active" href="#" onclick="showSection('dashboard')">
            <span class="material-icons">dashboard</span> Dashboard
        </a>
        <a class="nav-link" href="#" onclick="showSection('productos')">
            <span class="material-icons">inventory_2</span> Productos
        </a>
        <a class="nav-link" href="#" onclick="showSection('categorias')">
            <span class="material-icons">category</span> Categorías
        </a>
        <a class="nav-link" href="#" onclick="showSection('usuarios')">
            <span class="material-icons">people</span> Usuarios
        </a>
        <a class="nav-link" href="#" onclick="showSection('pedidos')">
            <span class="material-icons">receipt_long</span> Pedidos / Ventas
        </a>
        <hr style="border-color: rgba(255,255,255,0.2); margin: 16px;">
        <a class="nav-link" href="LogoutServlet">
            <span class="material-icons">logout</span> Cerrar Sesión
        </a>
    </nav>
</div>

<!-- Main Content -->
<div class="main-content">
    <!-- Topbar -->
    <div class="topbar">
        <div>
            <h5 class="mb-0" id="page-title" style="font-weight:bold">Dashboard</h5>
            <small class="text-muted">Panel de Administración - Urban Market</small>
        </div>
        <div class="d-flex align-items-center gap-3">
            <span class="material-icons text-muted">account_circle</span>
            <span class="fw-500"><%= usuario.getNombreUsuario() %></span>
        </div>
    </div>

    <!-- KPIs -->
    <%
        DAO.ProductoDAO productoDAO_ = new DAO.ProductoDAO();
        DAO.UsuarioDAO usuarioDAO_ = new DAO.UsuarioDAO();
        DAO.PedidoDAO pedidoDAO_ = new DAO.PedidoDAO();
        java.util.List<Clases.Producto> todosProductos = productoDAO_.obtenerTodos();
        java.util.List<Clases.Usuario> todosUsuarios = usuarioDAO_.obtenerTodos();
        java.util.List<Clases.Pedido> todosPedidos = pedidoDAO_.obtenerTodos();
        int productosConStockBajo = 0;
        for (Clases.Producto p : todosProductos) {
            if (p.getStock() <= 5) productosConStockBajo++;
        }
        double totalVentas = 0;
        for (Clases.Pedido ped : todosPedidos) {
            totalVentas += ped.getTotal();
        }
    %>
    <div class="row g-3 mb-4 dashboard-section">
        <div class="col-md-3">
            <div class="kpi-card red">
                <div class="kpi-value">S/ <%= String.format("%.0f", totalVentas) %></div>
                <div class="kpi-label">💰 Total en Ventas</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="kpi-card blue">
                <div class="kpi-value"><%= todosProductos.size() %></div>
                <div class="kpi-label">📦 Productos Activos</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="kpi-card green">
                <div class="kpi-value"><%= todosPedidos.size() %></div>
                <div class="kpi-label">🧾 Pedidos Totales</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="kpi-card orange">
                <div class="kpi-value"><%= productosConStockBajo %></div>
                <div class="kpi-label">⚠️ Alertas de Stock Bajo</div>
            </div>
        </div>
    </div>

    <!-- Alertas Stock -->
    <% if (productosConStockBajo > 0) { %>
    <div class="alert-stock mb-4 dashboard-section">
        <strong>⚠️ Atención: Productos con stock bajo (≤5 unidades)</strong>
        <ul class="mt-2 mb-0">
        <% for (Clases.Producto p : todosProductos) {
            if (p.getStock() <= 5) { %>
            <li><strong><%= p.getNombreProducto() %></strong> — Stock actual: <span class="text-danger"><%= p.getStock() %></span> unidades</li>
        <% } } %>
        </ul>
    </div>
    <% } %>

    <!-- ===== SECCIÓN: PRODUCTOS ===== -->
    <div id="section-productos" class="section-card">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h5 class="fw-bold mb-0"><span class="material-icons align-middle me-2">inventory_2</span>Gestión de Productos</h5>
            <button class="btn btn-primary-red btn-sm" data-bs-toggle="collapse" data-bs-target="#formCrearProducto">
                <span class="material-icons align-middle">add</span> Nuevo Producto
            </button>
        </div>
        <div class="collapse mb-4" id="formCrearProducto">
            <div class="card card-body bg-light border-0">
                <h6 class="fw-bold mb-3">Agregar Producto</h6>
                <form action="ProductoServlet" method="POST" class="row g-2">
                    <input type="hidden" name="accion" value="crear">
                    <div class="col-md-4"><input type="text" class="form-control form-control-sm" name="nombreProducto" placeholder="Nombre del producto" required></div>
                    <div class="col-md-4"><input type="text" class="form-control form-control-sm" name="descripcion" placeholder="Descripción"></div>
                    <div class="col-md-2"><input type="number" class="form-control form-control-sm" name="precio" placeholder="Precio" step="0.01" required></div>
                    <div class="col-md-2"><input type="number" class="form-control form-control-sm" name="stock" placeholder="Stock" required></div>
                    <div class="col-md-3">
                        <select class="form-select form-select-sm" name="sexo">
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Unisex">Unisex</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select form-select-sm" name="categoria">
                            <% DAO.CategoriaDAO catDAO = new DAO.CategoriaDAO();
                               for (Clases.Categoria cat : catDAO.obtenerTodas()) { %>
                            <option value="<%= cat.getIdCategoria() %>"><%= cat.getNombreCategoria() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2"><button type="submit" class="btn btn-primary-red btn-sm w-100">Agregar</button></div>
                </form>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead><tr><th>ID</th><th>Nombre</th><th>Precio</th><th>Stock</th><th>Sexo</th><th>Categoría</th><th>Acciones</th></tr></thead>
                <tbody>
                    <% for (Clases.Producto prod : todosProductos) { %>
                    <tr>
                        <td><%= prod.getIdProducto() %></td>
                        <td><strong><%= prod.getNombreProducto() %></strong><br><small class="text-muted"><%= prod.getDescripcion() %></small></td>
                        <td>S/ <%= String.format("%.2f", prod.getPrecio()) %></td>
                        <td>
                            <% if (prod.getStock() <= 5) { %>
                            <span class="badge-stock-low">⚠️ <%= prod.getStock() %></span>
                            <% } else { %>
                            <span class="badge-stock-ok"><%= prod.getStock() %></span>
                            <% } %>
                        </td>
                        <td><%= prod.getSexo() %></td>
                        <td><%= prod.getCategoria().getNombreCategoria() %></td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#modalEditarProducto<%= prod.getIdProducto() %>">Editar</button>
                            <form action="ProductoServlet" method="POST" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="id" value="<%= prod.getIdProducto() %>">
                                <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('¿Eliminar producto?')">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    <!-- Modal Editar -->
                    <div class="modal fade" id="modalEditarProducto<%= prod.getIdProducto() %>" tabindex="-1">
                        <div class="modal-dialog"><div class="modal-content">
                            <div class="modal-header"><h5 class="modal-title">Editar: <%= prod.getNombreProducto() %></h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
                            <div class="modal-body">
                                <form action="ProductoServlet" method="POST">
                                    <input type="hidden" name="accion" value="actualizar">
                                    <input type="hidden" name="id" value="<%= prod.getIdProducto() %>">
                                    <div class="mb-2"><label class="form-label form-label-sm">Nombre</label><input type="text" class="form-control form-control-sm" name="nombreProducto" value="<%= prod.getNombreProducto() %>" required></div>
                                    <div class="mb-2"><label class="form-label form-label-sm">Descripción</label><input type="text" class="form-control form-control-sm" name="descripcion" value="<%= prod.getDescripcion() %>"></div>
                                    <div class="row g-2 mb-2">
                                        <div class="col"><label class="form-label form-label-sm">Precio</label><input type="number" class="form-control form-control-sm" name="precio" value="<%= prod.getPrecio() %>" step="0.01" required></div>
                                        <div class="col"><label class="form-label form-label-sm">Stock</label><input type="number" class="form-control form-control-sm" name="stock" value="<%= prod.getStock() %>" required></div>
                                    </div>
                                    <div class="mb-2"><label class="form-label form-label-sm">Sexo</label>
                                        <select class="form-select form-select-sm" name="sexo">
                                            <option value="Masculino" <%= "Masculino".equals(prod.getSexo()) ? "selected" : "" %>>Masculino</option>
                                            <option value="Femenino" <%= "Femenino".equals(prod.getSexo()) ? "selected" : "" %>>Femenino</option>
                                            <option value="Unisex" <%= "Unisex".equals(prod.getSexo()) ? "selected" : "" %>>Unisex</option>
                                        </select>
                                    </div>
                                    <div class="mb-3"><label class="form-label form-label-sm">Categoría</label>
                                        <select class="form-select form-select-sm" name="categoria">
                                            <% DAO.CategoriaDAO cDAO = new DAO.CategoriaDAO();
                                               for (Clases.Categoria c : cDAO.obtenerTodas()) { %>
                                            <option value="<%= c.getIdCategoria() %>" <%= prod.getCategoria().getIdCategoria() == c.getIdCategoria() ? "selected" : "" %>><%= c.getNombreCategoria() %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary-red btn-sm w-100">Guardar Cambios</button>
                                </form>
                            </div>
                        </div></div>
                    </div>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ===== SECCIÓN: CATEGORÍAS ===== -->
    <div id="section-categorias" class="section-card">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h5 class="fw-bold mb-0"><span class="material-icons align-middle me-2">category</span>Gestión de Categorías</h5>
        </div>
        <form action="CategoriaServlet" method="POST" class="d-flex gap-2 mb-4">
            <input type="hidden" name="accion" value="crear">
            <input type="text" class="form-control form-control-sm" name="nombreCategoria" placeholder="Nueva categoría..." required>
            <button type="submit" class="btn btn-primary-red btn-sm px-4">Agregar</button>
        </form>
        <table class="table table-hover table-sm">
            <thead><tr><th>ID</th><th>Nombre</th><th>Acciones</th></tr></thead>
            <tbody>
                <% for (Clases.Categoria cat : catDAO.obtenerTodas()) { %>
                <tr>
                    <td><%= cat.getIdCategoria() %></td>
                    <td><%= cat.getNombreCategoria() %></td>
                    <td>
                        <form action="CategoriaServlet" method="POST" style="display:inline;">
                            <input type="hidden" name="accion" value="eliminar">
                            <input type="hidden" name="id" value="<%= cat.getIdCategoria() %>">
                            <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('¿Eliminar categoría?')">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- ===== SECCIÓN: USUARIOS ===== -->
    <div id="section-usuarios" class="section-card">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h5 class="fw-bold mb-0"><span class="material-icons align-middle me-2">people</span>Gestión de Usuarios</h5>
            <button class="btn btn-primary-red btn-sm" data-bs-toggle="collapse" data-bs-target="#formCrearUsuario">
                <span class="material-icons align-middle">add</span> Nuevo Usuario
            </button>
        </div>
        <div class="collapse mb-4" id="formCrearUsuario">
            <div class="card card-body bg-light border-0">
                <form action="UsuarioServlet" method="POST" class="row g-2">
                    <input type="hidden" name="accion" value="crear">
                    <div class="col-md-3"><input type="text" class="form-control form-control-sm" name="nombre" placeholder="Nombre" required></div>
                    <div class="col-md-3"><input type="email" class="form-control form-control-sm" name="correo" placeholder="Correo" required></div>
                    <div class="col-md-3"><input type="password" class="form-control form-control-sm" name="contrasena" placeholder="Contraseña" required></div>
                    <div class="col-md-2">
                        <select class="form-select form-select-sm" name="rol">
                            <option value="Cliente">Cliente</option>
                            <option value="Administrador">Administrador</option>
                        </select>
                    </div>
                    <div class="col-md-1"><button type="submit" class="btn btn-primary-red btn-sm w-100">+</button></div>
                </form>
            </div>
        </div>
        <table class="table table-hover table-sm">
            <thead><tr><th>ID</th><th>Nombre</th><th>Correo</th><th>Rol</th><th>Acciones</th></tr></thead>
            <tbody>
                <% for (Clases.Usuario u : todosUsuarios) { %>
                <tr>
                    <td><%= u.getIdUsuario() %></td>
                    <td><%= u.getNombreUsuario() %></td>
                    <td><%= u.getCorreo() %></td>
                    <td><span class="badge <%= "Administrador".equals(u.getRol()) ? "bg-danger" : "bg-secondary" %>"><%= u.getRol() %></span></td>
                    <td>
                        <form action="UsuarioServlet" method="POST" style="display:inline;">
                            <input type="hidden" name="accion" value="eliminar">
                            <input type="hidden" name="id" value="<%= u.getIdUsuario() %>">
                            <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('¿Eliminar usuario?')">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- ===== SECCIÓN: PEDIDOS ===== -->
    <div id="section-pedidos" class="section-card">
        <h5 class="fw-bold mb-4"><span class="material-icons align-middle me-2">receipt_long</span>Registro de Ventas / Pedidos</h5>
        <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead><tr><th>ID</th><th>Fecha</th><th>Subtotal</th><th>IGV</th><th>Total</th><th>Estado</th></tr></thead>
                <tbody>
                    <% for (Clases.Pedido ped : todosPedidos) { %>
                    <tr>
                        <td>#<%= ped.getIdPedido() %></td>
                        <td><%= ped.getFechaPedido() %></td>
                        <td>S/ <%= String.format("%.2f", ped.getSubtotal()) %></td>
                        <td>S/ <%= String.format("%.2f", ped.getIgv()) %></td>
                        <td><strong>S/ <%= String.format("%.2f", ped.getTotal()) %></strong></td>
                        <td><span class="badge bg-success">Completado</span></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function showSection(sectionName) {
    // Ocultar todas las secciones de contenido (no el dashboard KPI)
    document.querySelectorAll('.section-card').forEach(s => s.classList.remove('active'));
    document.querySelectorAll('.dashboard-section').forEach(s => s.style.display = 'none');

    // Actualizar sidebar activo
    document.querySelectorAll('.sidebar .nav-link').forEach(l => l.classList.remove('active'));
    event.target.closest('.nav-link').classList.add('active');

    // Actualizar título
    const titles = { dashboard: 'Dashboard', productos: 'Gestión de Productos', categorias: 'Gestión de Categorías', usuarios: 'Gestión de Usuarios', pedidos: 'Ventas / Pedidos' };
    document.getElementById('page-title').textContent = titles[sectionName] || 'Dashboard';

    if (sectionName === 'dashboard') {
        document.querySelectorAll('.dashboard-section').forEach(s => s.style.display = '');
    } else {
        const target = document.getElementById('section-' + sectionName);
        if (target) target.classList.add('active');
    }
}
</script>
</body>
</html>
