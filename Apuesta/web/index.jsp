<%-- 
    Document   : index
    Created on : 24-oct-2020, 19:30:59
    Author     : nurie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
        <form name="form1" action="s1" method="post">
            Nombre: <input type="text" name="nombre"><br>
            Evento Deportivo: Real Madrid VS FC Barcelona<br>          
            <input type="radio" name="valor" value="1" /> 1
            <input type="radio" name="valor" value="x" /> x
            <input type="radio" name="valor" value="2" /> 2<br>
            Cantidad: <input type="text" name="cantidad"><br>
             Resultado 1: cuota 1.85 <br>
             Resulado X: cuota 2.00 <br>
             Resultado 2: cuota 1.9 <br>
          <input type="submit" value="Apostar" name="apostar"/>  
        </form>
    </body>
</html>
