package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalida la sesión actual
        HttpSession session = request.getSession(false); // Obtiene la sesión sin crear una nueva
        if (session != null) {
            session.invalidate();
        }
        // Redirige al login
        response.sendRedirect("login.jsp");
    }
}
