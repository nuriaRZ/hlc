/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author nurie
 */
public class Administrador implements Serializable {
    String usuario;
    String pass;

    public Administrador(String usuario, String pass) {
        this.usuario = "admin";
        this.pass = "1234";
    }

    public String getUsuario() {
        return usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
    
}
