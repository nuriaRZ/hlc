<%-- 
    Document   : vistaUsuario
    Created on : 06-dic-2020, 18:29:01
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
        <title>Usuario</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        
    
    </head>
    <body>
        <h1>Mis mensajes</h1>
                <%   
                Statement s = Conexion.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM mensajes where remitente='"+session.getAttribute("usuario")+"'"); 
            %>
            <table class="table">
            <thead>
                <tr class="table-info">
                    <th>Id</th>
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
                        out.println("<td>" + rs.getString("destinatario") + "</td>");
                        out.println("<td>" + rs.getString("mensaje") + "</td>");  
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
             <form action="crearMensaje.jsp">
                <button type="submit" name="volver" class="btn btn-primary">Nuevo mensaje</button>
            </form>
        </div>
            
        
    </body>
</html>
