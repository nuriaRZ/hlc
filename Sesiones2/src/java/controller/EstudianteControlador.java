/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import modelo.Administrador;
import modelo.Persona;

/**
 *
 * @author nurie
 */
public class EstudianteControlador {
    public static void guardarArrayList(ArrayList<Persona> estudiantes, String fichero) throws FileNotFoundException, IOException{
        try{
            ObjectOutputStream ficheroSalida = new ObjectOutputStream(new FileOutputStream(fichero));
            ficheroSalida.writeObject(estudiantes);
            ficheroSalida.flush();
            ficheroSalida.close();
            System.out.println("Estudiantes guardados correctamente");
                    
        }catch(FileNotFoundException e){
            System.out.println("Error: El fichero no existe");
        }catch(IOException e){
            System.out.println("Error: Fallo en la escritura del fichero");
        }
    }
    
    public static void guardarArrayListAdmin(ArrayList<Administrador> administradores, String fichero){
        try{
            ObjectOutputStream ficheroSalida = new ObjectOutputStream(new FileOutputStream(fichero));
            ficheroSalida.writeObject(administradores);
            ficheroSalida.close();
            System.out.println("Admin guardados correctamente");
                    
        }catch(FileNotFoundException e){
            System.out.println("Error: El fichero no existe");
        }catch(IOException e){
            System.out.println("Error: Fallo en la escritura del fichero");
        }
    }
    
    
    public static ArrayList<Persona> leerFichero(String fichero){
        ArrayList<Persona> lista = null;
        try{
            ObjectInputStream ficheroEntrada = new ObjectInputStream(new FileInputStream(fichero));
            lista = (ArrayList<Persona>) ficheroEntrada.readObject();
        }catch(IOException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return lista;
    }
    
    public static ArrayList<Administrador> leerFicheroAdmin(String fichero){
        ArrayList<Administrador> lista = null;
        try{
            ObjectInputStream ficheroEntrada = new ObjectInputStream(new FileInputStream(fichero));
            lista = (ArrayList<Administrador>) ficheroEntrada.readObject();
        }catch(IOException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return lista;
    }
    
    public static void main(String args[]) throws IOException{
        String fichero = "D:\\estudiantes.dat";
        String ficheroAdmin = "D:\\estudiantesAdmin.dat";
        Persona estudiante1 = new Persona("101", "ana", "doblado", "15/05/1995", "matematicas", "segundo", "ana@dob.com", "an");
        Persona estudiante2 = new Persona("102", "pepe", "pepe", "13/02/1999", "informatica","tercero", "pepe@p.com", "pe");
        Persona estudiante3 = new Persona("103","pablo", "Ruiz", "5/05/1989", "derecho","primero", "pablo@ruiz.com", "pa");
        ArrayList<Persona> estudiantes = new ArrayList<Persona>();
        estudiantes.add(estudiante1);
        estudiantes.add(estudiante2);
        estudiantes.add(estudiante3);
        guardarArrayList(estudiantes, fichero);
        Administrador admin = new Administrador("admin", "1234");
        ArrayList<Administrador>administradores = new ArrayList<Administrador>();
        administradores.add(admin);
        guardarArrayListAdmin(administradores, ficheroAdmin);
    }
    
}
