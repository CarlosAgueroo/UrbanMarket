package Servlet;

import Clases.Categoria;
import Clases.Producto;
import DAO.ProductoDAO;
import DAO.CategoriaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProductoServlet")
public class ProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        ProductoDAO productoDAO = new ProductoDAO();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        switch (accion) {
            case "crear":
                String nombreProducto = request.getParameter("nombreProducto");
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                String sexo = request.getParameter("sexo");
                int idCategoria = Integer.parseInt(request.getParameter("categoria"));
                Categoria categoria = categoriaDAO.obtenerPorId(idCategoria);
                Producto producto = new Producto(0, nombreProducto, descripcion, precio, stock, sexo, categoria);
                productoDAO.crear(producto);
                break;
            case "eliminar":
                int idProducto = Integer.parseInt(request.getParameter("id"));
                productoDAO.borrar(idProducto);
                break;
            case "actualizar":
                int idProductoActualizar = Integer.parseInt(request.getParameter("id"));
                String nuevoNombreProducto = request.getParameter("nombreProducto");
                String nuevaDescripcion = request.getParameter("descripcion");
                double nuevoPrecio = Double.parseDouble(request.getParameter("precio"));
                int nuevoStock = Integer.parseInt(request.getParameter("stock"));
                String nuevoSexo = request.getParameter("sexo");
                int nuevaCategoriaId = Integer.parseInt(request.getParameter("categoria"));
                Categoria nuevaCategoria = categoriaDAO.obtenerPorId(nuevaCategoriaId);
                Producto productoActualizado = new Producto(idProductoActualizar, nuevoNombreProducto, nuevaDescripcion, nuevoPrecio, nuevoStock, nuevoSexo, nuevaCategoria);
                productoDAO.actualizar(productoActualizado);
                break;

            default:
                response.getWriter().write("Acción no soportada");
        }

        response.sendRedirect("panel_admin.jsp");
    }
}
