
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import model.Persona;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author alex
 */
public class RecuperaList {
    ArrayList<Persona> listaObjetos;
    
    public RecuperaList(String df) throws ClassNotFoundException
    {
       
       
            try (ObjectInputStream oos = new ObjectInputStream( 
                    new FileInputStream(df))) {
                this.listaObjetos=(ArrayList<Persona>)oos.readObject();
                oos.close();
            }   catch (IOException e ){System.out.println( e.getMessage());}
        
    
    }
    public ArrayList<Persona> get(){
        return this.listaObjetos;
    }
}
