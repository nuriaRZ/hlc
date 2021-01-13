<%-- 
    Document   : index
    Created on : 25-nov-2020, 19:15:25
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
        <form action="s1" method="post">
            <label>Nombre para la cookie</label><input type="text" name="nombre" value=""><br>
             <label>Valor de la cookie</label><input type="text" name="valor" value="">
             <input type="submit" name="crear" value="Crear">             
             <input type="submit" name="modificar" value="Modificar">
             <input type="submit" name="eliminar" value="Eliminar">
        </form>
        <form action="visualizar.jsp" method="post">
            <input type="submit" name="visualizar" value="Visualizar">
        </form>
    </body>
</html>
