/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nurie
 */
public class matrizMagica {
    int[][] matriz;
    
    public matrizMagica(int n){
        int j=0, k=n/2;
        for(int i=1; i<=25; i++){
             this.matriz[j][k]=i;
             if(i%n==0){
                 j++;
             }else{
                 j--;
                 k--;
                 
                 if(j<0)j=n-1;
                if(k<0) k=n-1;
                
             }
             
        }
    }

    public int[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(int[][] matriz) {
        this.matriz = matriz;
    }
    
}
