package com.project.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBHelper {

	private Connection conn;

	public DBHelper() {
	}

	public Connection getConnection() {

		if (conn == null) {
			try {
//				Oracle驱动程序:
//				Class.forName("oracle.jdbc.driver.OracleDriver");
//				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "123456");
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://192.168.1.155:3306/supplierman", "root", "root");
				System.out.println(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return conn;

	}
	
	public void closeConnection(){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public int executeUpdate(String sqlStr){
		Statement stmt = null;
		int num = 0;
		try {
			conn = getConnection();
			
			stmt = conn.createStatement();
			
			num = stmt.executeUpdate(sqlStr);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{

			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			closeConnection();
		}
		
		return num;
	}

}
