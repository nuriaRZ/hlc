<%-- 
    Document   : index
    Created on : 10-nov-2020, 13:50:51
    Author     : nurie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
		if (session.getAttribute("USR") == null || request.getParameter("cerrar") != null) {
			
			session.setAttribute("USR", null);
	%>
        <h1>Login</h1>
        <form action="loguear" method="post">
            Usuario: <input type="text" name="usuario" ><br>
            <input type="hidden" name="usuario">
            Contraseña: <input type="password" name="pass"><br>
            <input type="submit" name="entrar" value="Entrar">
        </form>
        <%
		} else {
			response.sendRedirect("vistaUsuario.jsp");
		}
	%>
    </body>
</html>
