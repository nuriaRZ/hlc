<%-- 
    Document   : index
    Created on : 30-oct-2020, 12:55:25
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
        <form action="loguearEstudiante" method="post">
            <input type="text" name="nombre" placeholder="Introduzca usuario">
            <input type="password" name="password" placeholder="Introduzca contraseña">
            <input type="submit" name="entrar" value="Entrar">
        </form>
        <form action="logueo.jsp" method="post">
            <input type="submit" name="crear" value="Crear estudiante">
        </form>
    </body>
</html>
