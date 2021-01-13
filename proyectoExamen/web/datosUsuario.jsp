<%-- 
    Document   : datosUsuario
    Created on : 05-dic-2020, 14:17:36
    Author     : nurie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos usuario</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
       
        <h1>Mis Datos</h1>
        <form action="editarDatosUsuario" method="Post">
           <div class='form-group'>
              <label>Usuario: </label>
              <input type='text' name='usuario' value="<% out.println(session.getAttribute("usuario")); %>" readonly >
            </div>
            <div class='form-group'>
              <label>Contraseña: </label>
              <input type='password' name='password' value="<% out.println(session.getAttribute("password")); %>" >
            </div>
            <div class='form-group'>
              <label>Nombre: </label>
              <input type='text' name='nombre' value="<% out.println(session.getAttribute("nombre")); %>" >
            </div>
            <div class='form-group'>
              <label>Apellidos: </label>
              <input type='text' name='apellidos' value="<% out.println(session.getAttribute("apellidos")); %>" >
            </div>
            <div class='form-group'>
              <label>Localidad: </label>
              <input type='text' name='localidad' value="<% out.println(session.getAttribute("localidad")); %>" >
            </div>
            <div class='form-group'>
              <label>Direccion: </label>
              <input type='text' name='direccion' value="<% out.println(session.getAttribute("direccion")); %>" >
            </div>                
              <input type='submit' class="btn btn-primary" name='guardarDatos' value='Guardar'>
        </form>    
            <form action="vistaUsuario.jsp" method="post">
                <input type="submit" class="btn btn-danger" name="cancelarDat" value="Cancelar">
            </form>
    
</html> 
    </body>
</html>
