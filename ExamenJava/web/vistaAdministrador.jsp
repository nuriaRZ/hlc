<%-- 
    Document   : vistaAdministrador
    Created on : 09-dic-2020, 9:02:11
    Author     : nurie
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.Conexion"%>
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
        <h1>Vista Administrador!</h1>
         <%     Statement s = (Statement) Conexion.getConnection().createStatement();
                ResultSet rs = s.executeQuery("select * from partido");
        %>
    <table class="table">
            <thead>
                <tr class="table-info">
                    <th>#</th>
                    <th>Equipo Local</th>
                    <th>Goles Local</th>
                    <th>Goles Visitantes</th>
                    <th>Equipo Visitante</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                   while(rs.next()) {
                       int id = rs.getInt("id");
                        out.println("<tr class=''>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        %>
                        <td><img src="<%out.print("images\\"); out.print(rs.getInt("e1"));%>.png" width="50px" height="50px"></td>
                        <%
                        out.println("<td>" + rs.getString("g1") + "</td>");
                        out.println("<td>" + rs.getInt("g2") + "</td>");  
                        out.println("<td>" + rs.getString("e2") + "</td>");                        
                       
                        %>
                        <td><img src="<%out.print("images\\"); out.print(rs.getInt("e2"));%>.png" width="50px" height="50px"></td>
                        <%
                            out.println("<form action='verParaEditar' method='post'>");
                        out.println("<input type='hidden' name='id' value='"+id+"'>");
                        out.println("<td><button type='submit'  class='btn btn-outline-primary' name='editar'>editar</button> </td>");            
                       out.println("</form>");
                            
                            out.println("<form action='borrar' method='post'>");
                        out.println("<input type='hidden' name='id' value='"+id+"'>");
                        out.println("<td><button type='submit'  class='btn btn-outline-warning' name='borrar'>borrar</button> </td>");            
                       out.println("</form>");
                       out.println("</tr>");
                     }
                     
                %>
            </tbody>
        </table>
            <form action="insertar" method="post">
            <div>
                <label>Equipo Local</label>
                <select name="e1">                                  
                    <option value="1">1</option>   
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>  
                </select>      
             <label>Goles Local</label>
                <select name="g1">                    
                   <%
                      for(int i=0; i<=10; i++){
                          out.println("<option value='"+i+"'>"+i+"</option>");
                      }
                      %>
                </select> 
             <label>Goles Visitante</label>
                <select name="g2">                    
                   <%
                      for(int i=0; i<=10; i++){
                          out.println("<option value='"+i+"'>"+i+"</option>");
                      }
                      %>
                </select>                                        
                
             <label>Equipo Visitante</label>
                <select name="e2">                   
                    <option value="1">1</option>   
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>      
                </select>
             <input type="submit" name="insertar" class="btn btn-outline-info" value="insertar">
            </div>
                
            </form>     
        <div class="btn-group">
            <form action="index.jsp">
                <button type="submit" name="volver" class="btn btn-outline-danger">Volver</button>
            </form>
         </div>
    </body>
</html>
