<%-- 
    Document   : vistaAdministrador
    Created on : 06-dic-2020, 18:28:46
    Author     : nurie
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <h1>Vista Administrador</h1>        
                <%   
                Statement s = Conexion.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM mensajes "); 
            %>
            <table class="table">
            <thead>
                <tr class="table-info">
                    <th>Id</th>
                    <th>Remitente</th>
                    <th>Destinatario</th>
                    <th>Mensaje</th>                     
                    <th></th>
                </tr>
            </thead>            
            <tbody>
                <%
                   while(rs.next()) {
                       int id = rs.getInt("id");
                        out.println("<tr class=''>");
                        out.println("<td>" + rs.getInt("id")+ "</td>");
                        out.println("<td>" + rs.getString("remitente") + "</td>");
                        out.println("<td>" + rs.getString("destinatario") + "</td>");
                        out.println("<td>" + rs.getString("mensaje") + "</td>"); 
                        out.println("<form action='borrarMensaje' method='post'>");
                        out.println("<input type='hidden' name='id' value='"+id+"'>");
                        out.println("<td><button type='submit'  class='btn btn-outline-warning' name='borrar'>borrar</button> </td>");            
                       out.println("</form>");
                        out.println("</tr>");
                     }
                %>
            </tbody>
        </table>
        
         <div class="btn-group">
            <form action="index.jsp">
                <button type="submit" name="volver" class="btn btn-outline-danger">Volver</button>
            </form>
         </div>
         <div class="btn-group">
            <form action="crearUsuario.jsp">
                <button type="submit" name="volver" class="btn btn-primary">Nuevo usuario</button>
            </form>
        </div>
        <div class="btn-group">
            <form action="crearMensaje.jsp">
                <button type="submit" name="volver" class="btn btn-primary">Nuevo mensaje</button>
            </form>
        </div>  
            <div class="btn-group">
                <form action="listaUsuarios.jsp">
                <button type="submit" name="usuarios" class="btn btn-primary">Ver usuarios</button>
            </form>
        </div>
            
        
    </body>
</html>

    
