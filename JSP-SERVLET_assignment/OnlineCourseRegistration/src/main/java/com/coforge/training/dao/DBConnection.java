package com.coforge.training.dao;

	import java.sql.Connection;
	import java.sql.DriverManager;

	public class DBConnection {

	    private static final String URL = "jdbc:mysql://localhost:3306/course_registration_db";
	    private static final String USER = "root";

	    // Replace with your own MySQL password
	    private static final String PASSWORD = "___________";

	    public static Connection getConnection() {

	        Connection con = null;

	        try {

	            Class.forName("com.mysql.cj.jdbc.Driver");

	            con = DriverManager.getConnection(URL, USER, PASSWORD);

	            System.out.println("Database Connected Successfully!");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return con;
	    }
	}

