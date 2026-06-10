package Servlet;

import Clases.Usuario;
import DAO.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        switch (accion) {
            case "crear":
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                String contrasena = request.getParameter("contrasena");
                String rol = request.getParameter("rol");
                Usuario usuario = new Usuario(0, nombre, correo, contrasena, rol);
                usuarioDAO.crear(usuario);
                break;

            case "eliminar":
                int idUsuario = Integer.parseInt(request.getParameter("id"));
                usuarioDAO.borrar(idUsuario);
                break;
            case "actualizar":
                int idUsuarioActualizar = Integer.parseInt(request.getParameter("id"));
                String nuevoNombreUsuario = request.getParameter("nombre");
                String nuevoCorreo = request.getParameter("correo");
                String nuevaContrasena = request.getParameter("contrasena");
                String nuevoRol = request.getParameter("rol");
                Usuario usuarioActualizado = new Usuario(idUsuarioActualizar, nuevoNombreUsuario, nuevoCorreo, nuevaContrasena, nuevoRol);
                usuarioDAO.actualizar(usuarioActualizado);
                break;

            default:
                response.getWriter().write("Acción no soportada");
        }

        response.sendRedirect("panel_admin.jsp");
    }
}
