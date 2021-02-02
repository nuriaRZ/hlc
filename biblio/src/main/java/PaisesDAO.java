
import com.mycompany.biblio.Paises;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nurie
 */
public class PaisesDAO {
    protected EntityManager em;
    private EntityManagerFactory emf = null;

    public PaisesDAO() {
       emf = Persistence.createEntityManagerFactory("com.mycompany_PruebaJPA_war_1.0-SNAPSHOTPU"); // poner el name de la unidad de persistencia
        // EntityManager em = emf.createEntityManager();
    }

    public void listar() {
        String hql = "SELECT p FROM Paises p";
        em = emf.createEntityManager();
        Query myQ = em.createQuery(hql);
        List<Paises> lista = myQ.getResultList();
        for (Paises p : lista) {
            //out.println("Id" + p.getId() + " nombre " + p.getName());
            System.out.println("PaisesDAO.listar()");
        }
    }

    public List<Paises> listarPaises() {
        String hql = "SELECT p FROM Paises p";
        em = emf.createEntityManager();

        Query myQ = em.createQuery(hql);
        return myQ.getResultList();

    }
    
    public void insertar(Paises pais){
        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(pais);
        em.getTransaction().commit();
    }
    
    public void eliminar(Paises p){
        try{
            em = emf.createEntityManager();
            em.getTransaction().begin();
            em.remove(em.merge(p));
            em.getTransaction().commit();
        }catch(Exception ex){
            ex.printStackTrace();            
        }finally{
            if(em!=null)em.close();
        }
    }
    
    public Paises buscarPorID(Long Ident){
        Paises p=null;
        try{
             em = emf.createEntityManager();
            TypedQuery mq = em.createNamedQuery("Paises.findByName", Paises.class);
            mq.setParameter("id", Ident);
            p = (Paises)mq.getSingleResult();
            
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(em!=null)em.close();
        }
      return p;  
    }
}
