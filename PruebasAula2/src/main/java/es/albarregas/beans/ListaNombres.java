/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

/**
 *
 * @author aitor
 */
public class ListaNombres {
    private String[] lista;

    public ListaNombres() {
        this.lista = new String[5];
        lista[0]="Luis";
        lista[1]="Pedro";
        lista[2]="Lara";
        lista[3]="Aitor";
        lista[4]="Jesus";
    }

    public String[] getLista() {
        return lista;
    }
    
    
}
