<%-- 
    Document   : index
    Created on : 03-nov-2020, 13:22:47
    Author     : nurie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cookie[] ac=request.getCookies();
            if(ac==null){
                out.println("No hay cookies");
                Cookie c = new Cookie("saludo", "Hola");                
                Cookie color = new Cookie("color", "red");
                response.addCookie(c);
                response.addCookie(color);
            }else{
                out.println("Cookie creada<br>");
                for(Cookie c: ac){
                    out.println(c.getName()+ ": "+c.getValue()+"<br>");
                    
                    if(c.getName()=="color"){
                        out.println("<body style='background-color:"+c.getValue()+"'>");
                    }
                }
                
             
                
                
            }
            %>
    </body>
</html>
