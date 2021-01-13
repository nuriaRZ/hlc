<%-- 
    Document   : vistaAdministrador
    Created on : 30-nov-2020, 19:39:43
    Author     : nurie
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="model.ConexionConf"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                    <th></th>
                </tr>
            </thead>            
            <tbody>
                <%
                    
                   while(rs.next()) {
                       int id = rs.getInt("id");
                        out.println("<tr class=''>");
                        out.println("<td>" + rs.getInt("id")+ "</td>");
                        out.println("<td>" + rs.getString("nombre") + "</td>");
                        out.println("<td>" + rs.getInt("cantidad") + "</td>");
                        out.println("<td>" + rs.getDouble("precio") + "€</td>");
                        
            out.println("<form action='verProducto' method='post'>");
            out.println("<input type='hidden' name='idProducto' value='"+id+"'>");
            out.println("<td><button type='submit'  class='btn btn-outline-info' name='editar'>editar</button> </td>");            
           out.println("</form>");  
           out.println("<form action='borrarProducto' method='post'>");
            out.println("<input type='hidden' name='idProducto' value='"+id+"'>");
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
            <form action="listaUsuarios.jsp">
                <button type="submit" name="btnUsuarios" class="btn btn-primary">Usuarios</button>
            </form>
        </div>
         <div class="btn-group">
             <form action="crearProducto.jsp" method="post">
                <button type="submit" name="nuevo" class="btn btn-primary">nuevo producto</button>
            </form>
        </div>
        
    </body>
</html>
