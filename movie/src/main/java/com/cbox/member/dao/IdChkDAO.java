package com.cbox.member.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cbox.common.DAO;

public class IdChkDAO extends DAO {
	private static IdChkDAO instance;
	private IdChkDAO() {}
	public static IdChkDAO getInstance() {
		if (instance == null) {
			instance = new IdChkDAO();
		}
		return instance;
	}
	
	
	private PreparedStatement pstmt;
	private ResultSet rs;
	private final String IDCHK = "SELECT MBR_ID FROM MEMBER WHERE MBR_ID = ?";
	public boolean idChk(String id) {
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(IDCHK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	private void close() { // 커넥션 끊어주는 close()메소드
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
