package com.cbox.review.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cbox.common.DAO;
import com.cbox.movie.vo.ReviewVO;

public class ReviewDAO extends DAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ReviewVO vo;
	
	private final String INSERT = "INSERT INTO review "
			+ "VALUES (RV_SEQ.NEXTVAL,?,?,sysdate,?,?)";
	
	public int insert(ReviewVO vo) {
		int n = 0;
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setDouble(1, vo.getRvRank());
			pstmt.setString(2, vo.getRvCont());
			pstmt.setInt(3, vo.getMvNum());
			pstmt.setInt(4, vo.getMbrNum());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
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
