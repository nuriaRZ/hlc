<%-- 
    Document   : index
    Created on : 09-dic-2020, 8:47:32
    Author     : nurie
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        
    <body>         
        <div class="container">
            
            <%     Statement s = (Statement) Conexion.getConnection().createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM equipo order by puntos");
        %>
    <table class="table">
            <thead>
                <tr class="table-info">
                    <th>#</th>
                    <th>Escudo</th>
                    <th>Equipo</th>
                    <th>Puntos</th>
                    <th>Victorias</th>
                    <th>Empates</th>
                    <th>Derrotas</th>
                    <th>GolesF</th>
                    <th>GolesC</th>
                </tr>
            </thead>
            <tbody>
                <%
                   while(rs.next()) {
                        out.println("<tr class=''>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        %>
                        <td><img src="<%out.print("images\\"); out.print(rs.getInt("id"));%>.png" width="50px" height="50px"></td>
                        <%
                        out.println("<td>" + rs.getString("nombre") + "</td>");
                        out.println("<td>" + rs.getInt("puntos") + "</td>"); 
                        out.println("<td>" + rs.getInt("v") + "</td>");
                        out.println("<td>" + rs.getInt("e") + "</td>");
                        out.println("<td>" + rs.getInt("d") + "</td>");
                        out.println("<td>" + rs.getInt("gf") + "</td>");
                        out.println("<td>" + rs.getInt("gc") + "</td>");
                        out.println("</tr>");
                     }
                %>
            </tbody>
        </table>
            <div id="login">
                <form action="loguear" method="post" class="form">
                    <input type="password" name="password" placeholder="Contraseña"><br>
                    <input type="submit" name="entrar" value="Administrador" class="btn btn-primary">
                </form> 
            </div>
        </div>
    </body>
</html>