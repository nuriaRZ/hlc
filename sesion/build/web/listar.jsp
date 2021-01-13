<%-- 
    Document   : listar
    Created on : 27-oct-2020, 13:30:12
    Author     : nurie
--%>

<%@page import="model.Persona"%>
<%@page import="model.Lista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Lista lista = new Lista();
            lista.add(new Persona("Pepe", 20));
           lista.add(new Persona("Maria", 23));
           lista = (Lista) new RecuperaList("C:\\Users\\nurie\\Documents\\datos.dat").get();
          %> 
          <table>
              <tr><th>Nombre</th></tr>
              <tr><th>Edad</th></tr>
          <%
           for(Persona p: lista){
              out.println("<tr><td>"+p.getNombre()+"</td>");
               out.println("<td>"+p.getEdad()+"</td></tr>");
           }
            %>
         </table>
    </body>
</html>
