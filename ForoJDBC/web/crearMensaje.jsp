<%-- 
    Document   : crearMensaje
    Created on : 06-dic-2020, 20:49:09
    Author     : nurie
--%>

<%@page import="model.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
      
        <h1>Nuevo Mensaje</h1>
        
        <form action="insertarMensaje" method="Post">
           <div class='form-group'>
              <label>Usuario: </label>
              <input type='text' name='remitente' value="<% out.println(session.getAttribute("usuario")); %>" readonly>
            </div>
            <div class='form-group'>
              <label>Destinatario: </label>
              <select name="destinatario">
                  <%
                      Statement s = Conexion.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT usuario from usuarios");
                    while(rs.next()){
                        %>
                        <option id="<% out.println( rs.getString("usuario")); %>"><% out.println( rs.getString("usuario")); %></option>
                        <%
                    }
                      %>
              </select>
            </div>
            <div class='form-group'>
              <label>Mensaje: </label>
              <textarea name="mensaje" rows="10" cols="50">Write something here</textarea>
            </div>  
              <input type='submit' class="btn btn-primary" name='guardar' value='Guardar'>
        </form> 
        <div>
            <form action="index.jsp" method="post">
            <input type="submit" class="btn btn-danger" name="cancelar" value="Cancelar">
        </form> 
        </div>
        
    
</html>   

