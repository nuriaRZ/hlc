<%-- 
    Document   : vistaUsuario
    Created on : 30-nov-2020, 19:39:18
    Author     : nurie
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ConexionConf"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    </head>
    <body>
        <h1>Lista de Productos</h1>
        <%   
                Statement s = ConexionConf.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM productos"); 
            %>
            <table class="table">
            <thead>
                <tr class="table-info">
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Precio</th>  
                    <th></th>
                </tr>
            </thead>            
            <tbody>
                <%
                   while(rs.next()) {
                       int id = rs.getInt("id");
                       int cantidad = rs.getInt("cantidad");
                        out.println("<tr class=''>");
                        out.println("<td>" + rs.getInt("id")+ "</td>");
                        out.println("<td>" + rs.getString("nombre") + "</td>");
                        out.println("<td>" + rs.getInt("cantidad") + "</td>");
                        out.println("<td>" + rs.getDouble("precio") + "€</td>");
                        out.println("<form action='comprarProducto' method='post'>");
                        out.println("<input type='hidden' name='idProducto' value='"+id+"'>");
                        out.println("<input type='hidden' name='cantidadProd' value='"+cantidad+"'>");
                        out.println("<td><button type='submit' class='btn btn-outline-success' name='comprar'>Comprar</button> </td>");            
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
            <form action="datosUsuario.jsp">
                <button type="submit" name="volver" class="btn btn-primary">Mis datos</button>
            </form>
        </div>
            
    </body>
</html>
