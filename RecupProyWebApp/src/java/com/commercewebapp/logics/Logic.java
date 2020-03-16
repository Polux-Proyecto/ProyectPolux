package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseX;

/**
 *
 * @author Mauricio Aguilar
 */
public abstract class  Logic {
    private DatabaseX database;

    public Logic() {
        this.setDatabase(createDatabase());
    }

    
    public DatabaseX getDatabase() {
        return database;
    }

    private void setDatabase(DatabaseX database) {
        this.database = database;
    }

    private DatabaseX createDatabase() {
        DatabaseX localDatabase = getDatabase();
        
        if(localDatabase==null){
            localDatabase = new DatabaseX();
        }
        
        return localDatabase;
    }
    
    
}
