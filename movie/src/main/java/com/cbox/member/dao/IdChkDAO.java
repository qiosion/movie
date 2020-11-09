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
	public boolean idChk(String mbr_id) {
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(IDCHK);
			pstmt.setString(1, mbr_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
			} else {
				result = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
