<%-- 
    Document   : index2
    Created on : 27-nov-2020, 11:06:45
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form action="s1" method="post">
 <ul>
     <li>
    <label for="ident">id:</label>
    <input type="number" id="ident" name="ident">
  </li>
  <li>
    <label for="name">Nombre:</label>
    <input type="text" id="name" name="nombre">
  </li>
  <li>
    <label for="mail">apellido</label>
    <input type="text" id="apellido" name="apellido">
  </li>
  <input type="submit" name="enviar" value="enviar">

 </ul>
</form>
    </body>
</html>
