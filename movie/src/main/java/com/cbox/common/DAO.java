package com.cbox.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hun";
	private String password = "1231";
	
	// private는 상속이 안되니까 connection 객체를 상속해야한다.
	public Connection conn;	// db 연결 객체
	
	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);	// 연결
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}