package com.mycompany.biblio;

import com.mycompany.biblio.Libros;
import com.mycompany.biblio.Paises;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-01-19T13:40:10")
@StaticMetamodel(Autores.class)
public class Autores_ { 

    public static volatile SingularAttribute<Autores, String> name;
    public static volatile SingularAttribute<Autores, Long> id;
    public static volatile CollectionAttribute<Autores, Libros> librosCollection;
    public static volatile SingularAttribute<Autores, Paises> pais;

}