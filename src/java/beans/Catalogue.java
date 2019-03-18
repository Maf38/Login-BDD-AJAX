/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;

/**
 *
 * @author gai
 */
public class Catalogue {
    ArrayList <Article> collection;
    
    public Catalogue(){
        lire();
    }
    
    public void lire(){
        this.collection=dao.Dao.lireCatalogue();
    }
    
    public void ajouter(Article art){
        this.collection.add(art);
    }

    public ArrayList<Article> getCollection() {
        return collection;
    }

    public void setCollection(ArrayList<Article> collection) {
        this.collection = collection;
    }
    
    
}
