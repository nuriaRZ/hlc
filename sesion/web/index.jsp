<%-- 
    Document   : index
    Created on : 23-oct-2020, 10:58:04
    Author     : nurie
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.ObjectOutput"%>
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
          out.println(session.isNew());
          if(session.isNew() && session.getAttribute("logueado") == null)
           response.sendRedirect("logueo.jsp");
            %>
            
          
           
    </body>
    
</html>
