<%@page import="Clases.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Pedido"%>
<%@page import="Clases.DetallePedido"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmación de Pedido</title>
</head>
<body>
    <%
        // Recuperar el objeto Usuario y Pedido de la sesión
        Usuario usuario = null;
        Pedido pedido = null;
        if (session != null) {
            usuario = (Usuario) session.getAttribute("usuario");
            pedido = (Pedido) session.getAttribute("ultimoPedido");
        }
        if (usuario == null || pedido == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <h1>¡Pedido Realizado con Éxito!</h1>
    <p>Gracias por tu compra, <strong><%= usuario.getNombreUsuario() %></strong>.</p>
    <p>Tu pedido ha sido registrado correctamente y estamos procesándolo.</p>
    
    <h2>Detalles del Pedido</h2>
    <p><strong>ID del Pedido:</strong> <%= pedido.getIdPedido() %></p>
    <p><strong>Fecha del Pedido:</strong> <%= pedido.getFechaPedido() %></p>
    <p><strong>Total:</strong> $<%= String.format("%.2f", pedido.getTotal()) %></p>
    
    <h3>Productos Comprados:</h3>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Nombre Producto</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Sub Total</th>
        </tr>
        <%
            for (DetallePedido detalle : pedido.getDetalles()) {
                Producto prod = detalle.getProducto();
        %>
        <tr>
            <td><%= prod.getNombreProducto() %></td>
            <td><%= detalle.getCantidad() %></td>
            <td>$<%= String.format("%.2f", prod.getPrecio()) %></td>
            <td>$<%= String.format("%.2f", detalle.getSubtotal()) %></td>
        </tr>
        <%
            }
        %>
    </table>
    
    <!-- Opciones para el usuario -->
    <form action="panel_cliente.jsp" method="get">
        <button type="submit">Volver al Panel de Cliente</button>
    </form>
    <br>
    <form action="LogoutServlet" method="get">
        <button type="submit">Cerrar Sesión</button>
    </form>
</body>
</html>
