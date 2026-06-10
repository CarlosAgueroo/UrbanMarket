<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    session.invalidate(); // Invalidar sesión
    response.sendRedirect("login.jsp"); // Redirigir al login
%>
