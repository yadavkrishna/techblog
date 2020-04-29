package com.techBlog.helper;
import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    //method for connecton 
    public static Connection getConnection(){
        if(con==null){
        try {
            //Load Class Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
         //create connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
        return con;    
    }
}
