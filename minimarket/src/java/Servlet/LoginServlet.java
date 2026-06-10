package Servlet;

import Clases.Usuario;
import DAO.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.validarCredenciales(correo, contrasena);

        if (usuario != null) {
            HttpSession session = request.getSession();
            // Almacenar el objeto Usuario completo en la sesión
            session.setAttribute("usuario", usuario);
            if ("Administrador".equalsIgnoreCase(usuario.getRol())) {
                response.sendRedirect("panel_admin.jsp");
            } else {
                response.sendRedirect("panel_cliente.jsp");
            }
        } else {
            response.getWriter().write("<script>alert('Credenciales inválidas.');"
                    + "window.location='login.jsp';</script>");
        }
    }
}
