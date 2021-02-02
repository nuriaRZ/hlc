<%-- 
    Document   : index
    Created on : 26 ene. 2021, 15:57:55
    Author     : alex
--%>

<%@page import="com.mycompany.maven5.Paises"%>
<%@page import="DAO.PaisesDAO"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="com.mycompany.maven5.Libros"%>
<%@page import="com.mycompany.maven5.Autores"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% out.println("<h1> JPA-HIBERNATE.</H1>");
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.mycompany_maven5_war_1.0PU");
            EntityManager em = emf.createEntityManager();

            Query miquery = em.createQuery("select a from Autores a");
            List<Autores> autlist = miquery.getResultList();
            for (Autores a : autlist) {
                out.println(a.getId() + ", " + a.getName() + " ," + a.getPais().getName() + "<br>");
            }
            out.println("***********************<br>");

            Query miquery2 = em.createNamedQuery("Libros.findAll", Libros.class);
            List<Libros> listalibros = miquery2.getResultList();
            for (Libros l : listalibros) {
                out.println("--"+l.getName() + "<br");
            }

            out.println("***********************<br>");

            TypedQuery miquery3 = em.createNamedQuery("Libros.findByName", Libros.class);
            miquery3.setParameter("name", "moby dick");
            listalibros = miquery3.getResultList();
            for (Libros l : listalibros) 
                out.println("<br>" + l.getName() + "," + l.getAut().getName() + "<br");
                      
                    
                   /*    TypedQuery miquery7=em.createNamedQuery("Paises.DeleteById", Paises.class);
                      miquery7.setParameter("id",8);
                      miquery7.executeUpdate();
                     
                     // Insercción con hpl con una orden nativa
                  Query myquery5=em.createNativeQuery("insert into paises values(10,'Italia')");
                    em.getTransaction().begin();
                     myquery5.executeUpdate();
                     em.getTransaction().commit();
                     
                    em.getTransaction().begin();
                    em.persist(new Paises((long)22,"Japón"));
                    em.getTransaction().commit();

                      */
            em.close();
          emf.close();

            List<Paises> mlp = new PaisesDAO().listarPaises();

            for (Paises p : mlp) {
                out.println(p.getId() + ", " + p.getName());
            }

           // new PaisesDAO().insertar(new Paises(12L, "Canadá"));
          // new PaisesDAO().eliminar(new Paises(36L,"Canada"));
           out.println("acceso");
         //  Paises p= new PaisesDAO().buscarPorId(1L);
         // if (p!=null)        out.println("hola"); else out.println("hola2");
        %>

    </body>
</html>
