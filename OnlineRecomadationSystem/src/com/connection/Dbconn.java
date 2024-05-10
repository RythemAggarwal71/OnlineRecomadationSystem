package com.connection;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconn {
	public Dbconn() throws SQLException {
        super();
       }

public static Connection conn()throws SQLException,ClassNotFoundException{
	Connection con;
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost/travelling", "root", "root");
	return (con);
}
}
