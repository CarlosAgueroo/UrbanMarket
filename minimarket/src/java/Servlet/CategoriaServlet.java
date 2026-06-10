package Servlet;

import Clases.Categoria;
import DAO.CategoriaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CategoriaServlet")
public class CategoriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        CategoriaDAO categoriaDAO = new CategoriaDAO();

        switch (accion) {
            case "crear":
                String nombreCategoria = request.getParameter("nombreCategoria");
                Categoria categoria = new Categoria(0, nombreCategoria);
                categoriaDAO.crear(categoria);
                break;

            case "eliminar":
                int idCategoria = Integer.parseInt(request.getParameter("id"));
                categoriaDAO.borrar(idCategoria);
                break;
            case "actualizar":
                int idCategoriaActualizar = Integer.parseInt(request.getParameter("id"));
                String nuevoNombre = request.getParameter("nombreCategoria");
                Categoria categoriaActualizada = new Categoria(idCategoriaActualizar, nuevoNombre);
                categoriaDAO.actualizar(categoriaActualizada);
                break;
            default:
                response.getWriter().write("Acción no soportada");
        }

        response.sendRedirect("panel_admin.jsp");
    }
}
