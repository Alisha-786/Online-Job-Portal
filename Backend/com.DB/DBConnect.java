package com.DB;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
            if (conn == null) {
            	 System.out.println("Creating new database connection...");
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "username", "password");
                System.out.println("Database connection established successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
