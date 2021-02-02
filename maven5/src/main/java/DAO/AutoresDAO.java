/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import com.mycompany.maven5.Autores;
import com.mycompany.maven5.Libros;
import com.mycompany.maven5.Paises;
import static java.lang.System.out;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NamedQuery;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author alex
 */
public class AutoresDAO {

    protected EntityManager em;
    private EntityManagerFactory emf = null;

    public AutoresDAO() {
        emf = Persistence.createEntityManagerFactory("com.mycompany_maven5_war_1.0PU");

    }



    public List<Autores> listarAutores() {

        String hql = "select a from Autores a";
        em = emf.createEntityManager();
        Query miquery = em.createQuery(hql);
        List<Autores> listautores = miquery.getResultList();
        em.close();
        return listautores;
        
    }

    public void insertar(Autores a) {

        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(a);
        em.getTransaction().commit();

    }

    public void eliminar(Autores a) {
        try {
            em = emf.createEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(a));
            em.getTransaction().commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
    public Autores buscarPorId(Long Ident) {

        Autores a = null;
        try {
            em = emf.createEntityManager();
            TypedQuery miquery = em.createNamedQuery("Autores.findById", Autores.class);
            miquery.setParameter("id", Ident);
            List<Autores> la = miquery.getResultList();
            if (!la.isEmpty()) {
                a = la.get(0);
                
            } 
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return a;
    }
    
        public Autores buscarPorId2(Long Ident) {

        Autores a = null;
        try {
            em = emf.createEntityManager();
            TypedQuery miquery = em.createNamedQuery("Autores.findById", Autores.class);
            miquery.setParameter("id", Ident);
            a=(Autores)miquery.getSingleResult();
             
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return a;
    }
        
                public Autores buscarPorNombre(String nombre) {

        Autores a = null;
        try {
            em = emf.createEntityManager();
            TypedQuery miquery = em.createNamedQuery("Autores.findByName", Autores.class);
            miquery.setParameter("name", nombre);
            // a=(Autores)miquery.getSingleResult();
            List<Autores> la = miquery.getResultList();
            if (!la.isEmpty())   a = la.get(0);
             
        }  catch (Exception ex) {
            ex.printStackTrace();
            a=null;
        }finally {
            if (em != null) {
                em.close();
            }
        }

        return a;
    }
    
    public void actualizar(Autores a) {
        try {
             em = emf.createEntityManager();
            // Iniciamos una transaccion
            em.getTransaction().begin();
            // Actualiazamos al objeto pais
            em.merge(a);
            // Terminamos la transaccion
            em.getTransaction().commit();
        } catch (Exception ex) {
            System.out.println("Error al actualizar objeto:" + ex.getMessage());
            // ex.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
}
