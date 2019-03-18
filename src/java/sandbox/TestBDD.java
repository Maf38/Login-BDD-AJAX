/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sandbox;

import dao.DbConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mafal
 */
public class TestBDD {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        try {
            
             Connection con;
             con = DbConnection.getInstance().ouvrir("mfcat1", "sa","chacal9176");
             ArrayList<String> listeCD = new ArrayList<>();
        
        
            Statement select;
            select = con.createStatement();

            ResultSet result = select.executeQuery(" select * from Articles");

            while (result.next()) {
                listeCD.add(result.getString(1));
                listeCD.add(result.getString(2));
                listeCD.add(result.getString(3));
                listeCD.add(result.getString(4));
                listeCD.add(result.getString(5));
                listeCD.add(result.getString(6));
            }
                
            for (String p :listeCD){
                System.out.println(p);
            }
            
                select.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(TestBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
                              
        
    }
    
}
