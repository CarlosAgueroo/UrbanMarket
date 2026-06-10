package Servlet;

import Clases.DetallePedido;
import Clases.Producto;
import Clases.Usuario;
import DAO.ProductoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AgregarAlCarritoServlet")
public class AgregarAlCarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener parámetros del formulario
            String idProductoStr = request.getParameter("idProducto");
            String cantidadStr = request.getParameter("cantidad");

            System.out.println("AgregarAlCarritoServlet: idProducto = " + idProductoStr + ", cantidad = " + cantidadStr);

            if (idProductoStr == null || cantidadStr == null) {
                throw new NullPointerException("idProducto o cantidad es null");
            }

            int idProducto = Integer.parseInt(idProductoStr);
            int cantidad = Integer.parseInt(cantidadStr);

            // Obtener el objeto Usuario de la sesión
            HttpSession session = request.getSession(false);
            if (session == null) {
                System.out.println("Sesión no encontrada. Redirigiendo a login.");
                response.sendRedirect("login.jsp");
                return;
            }
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario == null) {
                System.out.println("Usuario no encontrado en la sesión. Redirigiendo a login.");
                response.sendRedirect("login.jsp");
                return;
            }
            System.out.println("Usuario en sesión: " + usuario.getNombreUsuario());

            // Obtener el carrito de la sesión
            List<DetallePedido> carrito = (List<DetallePedido>) session.getAttribute("carrito");
            if (carrito == null) {
                carrito = new java.util.ArrayList<DetallePedido>();
                session.setAttribute("carrito", carrito);
                System.out.println("Carrito inicializado.");
            }
            System.out.println("Carrito actual tamaño: " + carrito.size());

            // Obtener el producto por ID
            ProductoDAO productoDAO = new ProductoDAO();
            Producto producto = productoDAO.obtenerPorId(idProducto);
            if (producto == null) {
                System.out.println("Producto con ID " + idProducto + " no encontrado.");
                response.getWriter().write("<script>alert('Producto no encontrado.'); window.location='panel_cliente.jsp';</script>");
                return;
            }
            System.out.println("Producto obtenido: " + producto.getNombreProducto());

            // Verificar que la cantidad no supere el stock
            if (cantidad > producto.getStock()) {
                System.out.println("Cantidad solicitada (" + cantidad + ") supera el stock disponible (" + producto.getStock() + ").");
                response.getWriter().write("<script>alert('La cantidad solicitada supera el stock disponible.'); window.location='panel_cliente.jsp';</script>");
                return;
            }

            boolean encontrado = false;
            for (DetallePedido detalle : carrito) {
                if (detalle.getProducto().getIdProducto() == idProducto) {
                    // Verificar que la nueva cantidad no supere el stock
                    int nuevaCantidad = detalle.getCantidad() + cantidad;
                    if (nuevaCantidad > producto.getStock()) {
                        System.out.println("Cantidad total en carrito (" + nuevaCantidad + ") supera el stock disponible (" + producto.getStock() + ").");
                        response.getWriter().write("<script>alert('La cantidad total en el carrito supera el stock disponible.'); window.location='panel_cliente.jsp';</script>");
                        return;
                    }
                    detalle.setCantidad(nuevaCantidad);
                    detalle.setSubtotal(nuevaCantidad * producto.getPrecio());
                    encontrado = true;
                    System.out.println("Actualizando cantidad en carrito: " + nuevaCantidad);
                    break;
                }
            }

            if (!encontrado) {
                // Agregar nuevo producto al carrito
                DetallePedido detalle = new DetallePedido();
                detalle.setProducto(producto);
                detalle.setCantidad(cantidad);
                detalle.setSubtotal(cantidad * producto.getPrecio());
                carrito.add(detalle);
                System.out.println("Agregando nuevo producto al carrito: " + producto.getNombreProducto());
            }

            // Actualizar el carrito en la sesión
            session.setAttribute("carrito", carrito);
            System.out.println("Carrito actualizado. Total productos en carrito: " + carrito.size());

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
