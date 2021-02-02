/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
public class PaisesDAO {

    protected EntityManager em;
    private EntityManagerFactory emf = null;

    public PaisesDAO() {
        emf = Persistence.createEntityManagerFactory("com.mycompany_maven5_war_1.0PU");

    }

    public void listar() {
        String hql = "select p from Paises p";
        em = emf.createEntityManager();
        Query miquery = em.createQuery(hql);
        List<Paises> listapaises = miquery.getResultList();
        for (Paises p : listapaises) {
            out.println(p.getId() + ", " + p.getName());
        }

    }

    public List<Paises> listarPaises() {

        String hql = "select p from Paises p";
        em = emf.createEntityManager();
        Query miquery = em.createQuery(hql);
        List<Paises> listapaises = miquery.getResultList();
        return listapaises;
    }

    public void insertar(Paises pais) {

        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(pais);
        em.getTransaction().commit();

    }

    public void eliminar(Paises p) {
        try {
            em = emf.createEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(p));
            em.getTransaction().commit();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public Paises buscarPorId(Long Ident) {

        Paises p = null;
        try {
            em = emf.createEntityManager();
            TypedQuery miquery = em.createNamedQuery("Paises.findById", Paises.class);
            miquery.setParameter("id", Ident);
            List<Paises> lp = miquery.getResultList();
            if (!lp.isEmpty()) {
                p = lp.get(0);
                
            } 
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return p;
    }
    
        public Paises buscarPorId2(Long Ident) {

        Paises p = null;
        try {
            em = emf.createEntityManager();
            TypedQuery miquery = em.createNamedQuery("Paises.findById", Paises.class);
            miquery.setParameter("id", Ident);
            p=(Paises)miquery.getSingleResult();
             
        } finally {
            if (em != null) {
                em.close();
            }
        }

        return p;
    }
    
    public void actualizar(Paises pais) {
        try {
             em = emf.createEntityManager();
            // Iniciamos una transaccion
            em.getTransaction().begin();
            // Actualiazamos al objeto pais
            em.merge(pais);
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
