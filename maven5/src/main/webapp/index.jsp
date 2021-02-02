<%-- 
    Document   : index2
    Created on : 27 ene. 2021, 21:20:12
    Author     : alex
--%>

<%@page import="DAO.AutoresDAO"%>
<%@page import="com.mycompany.maven5.Autores"%>
<%@page import="DAO.PaisesDAO"%>
<%@page import="com.mycompany.maven5.Paises"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JPA-2!</h1>
        <%   //Listar paises
            List<Paises> mlp = new PaisesDAO().listarPaises();

            for (Paises p : mlp) {
                out.println(p.getId() + ", " + p.getName());

            }
            out.println("<br>*******************<br>");
            // new PaisesDAO().insertar(new Paises(3L, "Rusia"));//Insertar Pais
          //  new PaisesDAO().eliminar(new Paises(44L, "Rusia"));//Eliminar país

          //Buscar país por id, método 1
          Paises p= new PaisesDAO().buscarPorId(1L);
          if (p!=null)  out.println("<br>"+p.getName()+"<br>");  
          
          out.println("<br>*******************<br>");
          //Actualizar país
          new PaisesDAO().actualizar(new Paises(1L,"América"));
          //buscar país por id,   método 2
            p= new PaisesDAO().buscarPorId2(34L);
          if (p!=null)  out.println("<br>"+p.getName()+"<br>"); 

          out.println("<br>*******************<br>");
          //listar autores
            List<Autores> mla = new AutoresDAO().listarAutores();

            for (Autores a : mla) 
                out.println(a.getId() + ", " + a.getName()+", "+a.getPais().getName()+"<br>");

          out.println("<br>*******************<br>");
        Autores a2; //Insertar un autor buscando antes el país a través de su id
        //   a2=new Autores(0L,"Cela"); 
       //   a2.setPais(new PaisesDAO().buscarPorId2(34L));
       //   new AutoresDAO().insertar(a2);
            out.println("<br>*******************<br>");
            
          //Buscar autor por su id
            a2 =new AutoresDAO().buscarPorId(3L);
            out.println(a2.getId() + ", " + a2.getName()+", "+a2.getPais().getName()+"<br>");
            
            out.println("<br>*******************<br>");
           
            //Buscar autor por su nombre
          a2 =new AutoresDAO().buscarPorNombre("Meville");
            if (a2!=null) out.println(a2.getId() + ", " + a2.getName()+", "+a2.getPais().getName()+"<br>");
         /*  
            //Actutalizar un autor
            a2.setName("Andrés de Cervantes y Saavedra");
            new AutoresDAO().actualizar(a2);*/
            

          
        %>
    </body>
</html>
