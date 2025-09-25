package com.ljh;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnMain {

	public static void main(String[] args) {

		Connection conn = null;
		
		/*
		 * try { conn = DriverManager.getConnection(url, user, password);
		 * System.out.println("연결 성공");
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); }
		 */		
		
		try {
			conn = DBConnection.getConnection();
		}finally{
//			연결해제
		}
		
		CRUDClass crudClass = new CRUDClass();
	}

}





