package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieVO;

public class MovieReservationDAO extends DAO {

	
	private PreparedStatement psmt;
	private ResultSet rs;

	private MovieVO vo;

private final String SELECT_ALL = "SELECT * FROM MOVIE";
	
	public List<MovieVO> selectAll(){ //Moive 전체 조회
		List<MovieVO> list = new ArrayList<>();
		
		try {
			psmt = conn.prepareStatement(SELECT_ALL); //DAO를 상속받아서 conn 바로 접근가능
			rs = psmt.executeQuery();//준비된 selectall query문을 실행
			
			while(rs.next()) { //실행한 쿼리의 결과값이 1개라도 존재하면 true, 없으면 false
				vo = new MovieVO(
						rs.getInt("mv_num"),
						rs.getString("mv_title"),
						rs.getString("mv_dir"),
						rs.getString("mv_cha"),
						rs.getDate("mv_strdate"),
						rs.getDate("mv_findate"),
						rs.getString("mv_sum"),
						rs.getString("mv_type"),
						rs.getString("mv_cont"),
						rs.getString("mv_img"),
						rs.getString("mv_teaser"),
						rs.getInt("mv_rank"),
						rs.getString("mv_age"));
				list.add(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
		
	}

	// 모든 동작 후 연결 끊어주기
	private void close() {
		try {
			// 열어준거의 반대방향으로 닫아준다.
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
