package Servlet;

import Clases.DetallePedido;
import Clases.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet("/QuitarDelCarritoServlet")
public class QuitarDelCarritoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener el ID del producto a quitar
            String idProductoStr = request.getParameter("idProducto");
            if (idProductoStr == null) {
                throw new NullPointerException("idProducto es null");
            }

            int idProducto = Integer.parseInt(idProductoStr);

            // Obtener el objeto Usuario de la sesión
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Obtener el carrito de la sesión
            List<DetallePedido> carrito = (List<DetallePedido>) session.getAttribute("carrito");
            if (carrito != null) {
                Iterator<DetallePedido> iter = carrito.iterator();
                while (iter.hasNext()) {
                    DetallePedido detalle = iter.next();
                    if (detalle.getProducto().getIdProducto() == idProducto) {
                        iter.remove();
                        System.out.println("Producto con ID " + idProducto + " eliminado del carrito.");
                        break;
                    }
                }
                session.setAttribute("carrito", carrito);
            }

            // Redirigir de vuelta al panel del cliente
            response.sendRedirect("panel_cliente.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write("<script>alert('Datos inválidos.'); window.location='panel_cliente.jsp';</script>");
        } catch (NullPointerException e) {
            e.printStackTrace();
            response.getWriter().write("<script>alert('Error en los datos proporcionados.'); window.location='panel_cliente.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("<script>alert('Ocurrió un error.'); window.location='panel_cliente.jsp';</script>");
        }
    }
}
