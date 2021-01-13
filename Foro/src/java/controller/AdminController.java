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
import model.Administrador;
import model.Comentario;
import model.Usuario;

/**
 *
 * @author nurie
 */
public class AdminController{
    public static void guardarArrayList(ArrayList<Usuario> usuarios, String fichero){
        try{
            ObjectOutputStream ficheroSalida = new ObjectOutputStream(new FileOutputStream(fichero));
            ficheroSalida.writeObject(usuarios);
            ficheroSalida.close();
            System.out.println("Usuarios guardados correctamente");
                    
        }catch(FileNotFoundException fnfe){
            System.out.println("Error: El fichero no existe");
        }catch(IOException ioe){
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
    
    public static void guardarArrayListComentarios(ArrayList<Comentario> comentarios, String fichero){
        try{
            ObjectOutputStream ficheroSalida = new ObjectOutputStream(new FileOutputStream(fichero));
            ficheroSalida.writeObject(comentarios);
            ficheroSalida.close();
            System.out.println("Comentarios guardados correctamente");
                    
        }catch(FileNotFoundException e){
            System.out.println("Error: El fichero no existe");
        }catch(IOException e){
            System.out.println("Error: Fallo en la escritura del fichero");
        }
    }
    
    public static ArrayList<Usuario> leerFichero(String fichero){
        ArrayList<Usuario> lista = null;
        try{
            ObjectInputStream ficheroEntrada = new ObjectInputStream(new FileInputStream(fichero));
            lista = (ArrayList<Usuario>) ficheroEntrada.readObject();
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
    
    public static ArrayList<Comentario> leerFicheroComentarios(String fichero){
        ArrayList<Comentario> lista = null;
        try{
            ObjectInputStream ficheroEntrada = new ObjectInputStream(new FileInputStream(fichero));
            lista = (ArrayList<Comentario>) ficheroEntrada.readObject();
        }catch(IOException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return lista;
    }
    
    public static void main(String args[]){
        String fichero = "D:\\usuarios.dat";
        String ficheroAdmin = "D:\\admin.dat";
        String ficheroComent = "D:\\comentarios.dat";
        Usuario usu1 = new Usuario(1,"ana", "1234");
        Usuario usu2 = new Usuario(2,"pepe", "1234");
        Usuario usu3 = new Usuario(3,"pablo", "1234");        
        Administrador admin = new Administrador("admin", "1234");
        Comentario com1 = new Comentario(1, "Este es un comentario", usu1);
        Comentario com2 = new Comentario(2, "Otro comentario", usu2);
        Comentario com3 = new Comentario(1, "ultimo comentario", usu3);
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
        ArrayList<Administrador>administradores = new ArrayList<Administrador>();
        ArrayList<Comentario> comentarios = new ArrayList<Comentario>();
        usuarios.add(usu1);
        usuarios.add(usu2);
        usuarios.add(usu3);
        administradores.add(admin);
        comentarios.add(com1);
        comentarios.add(com2);
        comentarios.add(com3);
        guardarArrayList(usuarios, fichero);
        guardarArrayListAdmin(administradores, ficheroAdmin);
        guardarArrayListComentarios(comentarios, ficheroComent);
    }
    
}
