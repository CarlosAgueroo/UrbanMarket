package Servlet;

import Clases.DetallePedido;
import Clases.Pedido;
import Clases.Producto;
import Clases.Usuario;
import DAO.PedidoDAO;
import DAO.ProductoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/RealizarPedidoServlet")
public class RealizarPedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la sesión existente
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Obtener el usuario de la sesión
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Obtener el carrito de la sesión
        List<DetallePedido> carrito = (List<DetallePedido>) session.getAttribute("carrito");
        if (carrito == null || carrito.isEmpty()) {
            session.setAttribute("mensajeError", "El carrito está vacío.");
            response.sendRedirect("panel_cliente.jsp");
            return;
        }

        // Calcular el total
        double subTotal = 0.0;
        for (DetallePedido detalle : carrito) {
            subTotal += detalle.getSubtotal();
        }
        double igv = subTotal * 0.18;
        double total = subTotal + igv;

        // Crear el objeto Pedido
        Pedido pedido = new Pedido();
        pedido.setUsuario(usuario);
        pedido.setFechaPedido(new Date());
        pedido.setSubtotal(subTotal);
        pedido.setIgv(igv);
        pedido.setTotal(total);
        pedido.setDetalles(carrito);

        // Crear el pedido en la base de datos
        PedidoDAO pedidoDAO = new PedidoDAO();
        boolean exito = pedidoDAO.crear(pedido, carrito);

        if (exito) {
            // Actualizar el stock de cada producto en el carrito
            ProductoDAO productoDAO = new ProductoDAO();
            boolean stockExitoso = true;

            for (DetallePedido detalle : carrito) {
                Producto producto = detalle.getProducto();
                int cantidadComprada = detalle.getCantidad();

                Producto p = productoDAO.obtenerPorId(producto.getIdProducto());
                p.setStock(p.getStock() - cantidadComprada);
                if (productoDAO.actualizar(p) == false) {
                    stockExitoso = false;
                    break;
                }
            }

            if (stockExitoso) {
                // Limpiar el carrito
                carrito.clear();
                session.setAttribute("carrito", carrito);

                // Establecer mensaje de confirmación
                session.setAttribute("mensajeConfirmacion", "¡Tu pedido ha sido realizado exitosamente!");

                // Redirigir al panel del cliente
                response.sendRedirect("panel_cliente.jsp");
            } else {
                // Manejar error en la actualización del stock
                session.setAttribute("mensajeError", "Error al actualizar el stock de los productos. Por favor, intenta nuevamente.");
                response.sendRedirect("panel_cliente.jsp");
            }
        } else {
            // Manejar error en la creación del pedido
            session.setAttribute("mensajeError", "Error al realizar el pedido. Por favor, intenta nuevamente.");
            response.sendRedirect("panel_cliente.jsp");
        }
    }
}
