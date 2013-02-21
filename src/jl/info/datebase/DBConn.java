package jl.info.datebase;

import java.sql.*;

public class DBConn {
	private String DBDRIVER = "oracle.jdbc.driver.OracleDriver" ;
	private String DBURL = "jdbc:oracle:thin:@localhost:1521:sq" ;
	private String DBUSER = "scott" ;
	private String DBPASSWORD = "tiger" ;
	private Connection conn	= null ;
	
	public Connection getConnection(){
		try {
			Class.forName(DBDRIVER) ;
			this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void close(){
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
