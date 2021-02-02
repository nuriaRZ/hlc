package com.mycompany.biblio;

import com.mycompany.biblio.Autores;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-01-19T13:40:10")
@StaticMetamodel(Paises.class)
public class Paises_ { 

    public static volatile SingularAttribute<Paises, String> name;
    public static volatile SingularAttribute<Paises, Long> id;
    public static volatile CollectionAttribute<Paises, Autores> autoresCollection;

}