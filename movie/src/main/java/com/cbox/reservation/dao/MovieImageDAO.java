package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieVO;
import com.cbox.reservation.vo.MovieImageVO;

public class MovieImageDAO extends DAO{
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	private final String SELECT = "SELECT * FROM MOVIE WHERE MV_TITLE=?"; //한건조회
	
public MovieImageVO select(MovieImageVO vo){//한건조회
		
		
		try {
			pstmt = conn.prepareStatement(SELECT);
			pstmt.setString(1, vo.getMv_title());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMv_img(rs.getString("mv_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	
	// 모든 동작 후 연결 끊어주기
		private void close() {
			try {
				// 열어준거의 반대방향으로 닫아준다.
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
