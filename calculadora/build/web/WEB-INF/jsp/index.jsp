<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora</title>
        <style>
           .button{
               border:1px;
               color: gray;
                text-align: center;
                display: inline-block;
                margin: 4px 2px;
            } 
            .button1{margin-left: 180px}
        </style>
    </head>

    <body>
        <h1>Calculadora</h1>
        <form name="form1" action="/calculadora/s1" method="post">
            <input type="number" name="num1">            
            <input type="number" name="num2">            
            <input type="submit" name="operador" value="+" />
            <input type="submit" name="operador" value="-" />
            <input type="submit" name="operador" value="*" />
            <input type="submit" name="operador" value="/" />
            
        </form>
        
    </body>
</html>
