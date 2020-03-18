/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.commercewebapp.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Mauricio Aguilar
 */
public class DatabaseZ {
//Variables de instancia
    private Connection connection;
    private Statement statement;
    
//Constructor

    public DatabaseZ() {
    //Conección a la BD
        this.setConnection(createConnection());
    //Creación del Statement
        setStatement(createStatement());
    }
    
    
//Getters y setters
    public Connection getConnection() {
        return connection;
    }

    private void setConnection(Connection pConnection) {
        this.connection = pConnection;
    }

    public Statement getStatement() {
        return statement;
    }

    private void setStatement(Statement pStatement) {
        this.statement = pStatement;
    }

    private Connection createConnection() {
        Connection localConnection = getConnection();
        
        if (localConnection==null){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                localConnection= DriverManager.getConnection("jdbc:mysql://localhost/comercebd?"
                    + "user=root&password=12345678B"
                    + "&usUnicode=true&useJDBCCompliantTimeZoneShift=true"
                    + "&useLegacyDateTimeCode=false&serverTimezone=UTC"
                    + "&autoReconnect=true&useSSL=false");
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseZ.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        
        return localConnection;
    }

    private Statement createStatement() {
        Statement localStatement = this.getStatement();
        Connection localConnection = getConnection();
        if(localStatement==null){
            try {
                if(!localConnection.isClosed()){
                    localStatement = localConnection.createStatement();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseZ.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        return localStatement;
    }
    
    public boolean executeNonQueryBool (String pSql){
        boolean hasFailed = true;
        Statement localStatement = this.getStatement();
        
        if(localStatement!=null){
            try {
                hasFailed = localStatement.execute(pSql);
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseZ.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return hasFailed;
    }
    
    public ResultSet executeQuery(String pSql){
        ResultSet result = null;
        Statement localStatement = this.getStatement();
        if (localStatement!=null){
            try {
                result = localStatement.executeQuery(pSql);
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseZ.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    } 
}
