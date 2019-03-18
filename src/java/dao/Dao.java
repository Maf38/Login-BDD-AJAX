/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;



import beans.Article;
import beans.Catalogue;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gai
 */
public class Dao {
    
    
        public static void CreerConnexion(String login, String password) 
    {
        try {
            Connection con = DbConnection.getInstance().getCo();

            Statement cs = con.createStatement();

        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }

    
    }
        
        public static ArrayList <String> getListe(){
            
            try {
                Connection con=  DbConnection.getInstance().getCo();
                      
                ArrayList<String> listeCD = new ArrayList<>();
                
                Statement select = con.createStatement();
                ResultSet result = select.executeQuery(" select * from Articles");
                
                while (result.next()) {
                    listeCD.add(result.getString(1));
                    listeCD.add(result.getString(2));
                    listeCD.add(result.getString(3));
                    listeCD.add(result.getString(4));
                    listeCD.add(result.getString(5));
                    listeCD.add(result.getString(6));
                }
                
                select.close();
                              
                
                return listeCD;
                
            } catch (SQLException ex) {
                Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
                
                return null;
            }
        }
        
        public static ArrayList <Article> lireCatalogue(){
            
            try {
                Connection con=  DbConnection.getInstance().getCo();
                      
                ArrayList<Article> liste = new ArrayList<>();
                
                Statement select = con.createStatement();
                ResultSet result = select.executeQuery(" select * from Articles");
                
                while (result.next()) {
                   Article art= new Article();
                   art.setReference(result.getString(1));
                   art.setTitre(result.getString(2));
                   art.setAuteur(result.getString(3));
                   art.setPhoto(result.getString(4));
                   art.setPrix(result.getString(5));
                   art.setGenre(result.getString(6));
                   liste.add(art);
                }
                
                select.close();
                              
                
                return liste;
                
            } catch (SQLException ex) {
                Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
                
                return null;
            }
        }
    
}
