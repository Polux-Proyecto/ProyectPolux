package com.commercewebapp.logics;

import com.commercewebapp.database.DatabaseZ;

/**
 *
 * @author Mauricio Aguilar
 */
public abstract class  Logic {
    private DatabaseZ database;

    public Logic() {
        this.setDatabase(createDatabase());
    }

    
    public DatabaseZ getDatabase() {
        return database;
    }

    private void setDatabase(DatabaseZ database) {
        this.database = database;
    }

    private DatabaseZ createDatabase() {
        DatabaseZ localDatabase = getDatabase();
        
        if(localDatabase==null){
            localDatabase = new DatabaseZ();
        }
        
        return localDatabase;
    }
    
    
}
