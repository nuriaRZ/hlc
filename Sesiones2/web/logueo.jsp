<%-- 
    Document   : loguear
    Created on : 31-oct-2020, 12:44:28
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
        <h1>Página Login</h1>
        <form action="loguearEstudiante" method="post" >
            <p>Nombre: <input type="text" name="usuario"></p>
            <p>Apellidos: <input type="text" name="apellidos"></p>            
            <p>Contraseña: <input type="password" name="password" placeholder="Elije una contraseña fuerte"></p>
            <p>Fecha nacimiento: <input type="text" name="fecha_nac"></p>            
            <p>Carrera: <input type="text" name="carrera"></p>
            <p>Semestre: <input type="text" name="semestre"></p>
            <p>Email: <input type="text" name="email"></p>
            <p><input type="submit" name="nuevo" value="Nuevo estudiante"></p>
        </form>
       
    </body>
</html>
