/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebadb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 78GDO
 */
public class PruebaDB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            // TODO code application logic here
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sys?"
                    + "user=root&password=12345"
                    + "&usUnicode=true&useJDBCCompliantTimeZoneShift=true"
                    + "&useLegacyDateTimeCode=false&serverTimezone=UTC");
                    //+ "&autoReconnect=true&useSSL=false");
            if(!conn.isClosed())
            {
                System.out.println("database is open");
            }
            else
            {
                System.out.println("error in database");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PruebaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
    }
    
}
