package service;

import java.sql.SQLException;
import Connect.DataDB;

public abstract class Service
{
    protected DataDB db;
    
    public Service() throws SQLException, ClassNotFoundException {
        this.db = new DataDB();
    }
}