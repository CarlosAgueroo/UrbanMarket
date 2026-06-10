package Servlet;

import Clases.Usuario;
import DAO.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        Usuario usuario = new Usuario(0, nombre, correo, contrasena, "Cliente");
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        if (usuarioDAO.crear(usuario)) {
            response.getWriter().write("<script>alert('Registro exitoso.');"
                    + "window.location='login.jsp';</script>");
        } else {
            response.getWriter().write("<script>alert('Error al registrar.');"
                    + "window.location='registro.jsp';</script>");
        }
    }
}
