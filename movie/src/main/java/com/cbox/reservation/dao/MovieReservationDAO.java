package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieVO;
import com.cbox.reservation.vo.MovieReservationVO;

public class MovieReservationDAO extends DAO {

	
	private PreparedStatement psmt;
	private ResultSet rs;

	private MovieVO vo;
	private MovieReservationVO rvo;

	private final String SELECT = "SELECT * FROM MOVIE WHERE MV_TITLE=?"; //한건조회
private final String SELECT_ALL = "SELECT * FROM MOVIE"; // 전체조회
private final String SELECT_ALL_TIME_DATE_MOVIE = 
		"select m.mv_title \"영화명\", tt.tt_scr_date \"상영일\", tt.tt_start \"상영시작시간\", th.th_name \"상영관\", th.th_max \"총좌석\" ,(th.th_max-count(*)) \"잔여좌석\"\r\n" + 
		"from movie m, timetable tt, theater th, ticketing tk\r\n" + 
		"where m.mv_num = tt.mv_num\r\n" + 
		"and tt.th_num = th.th_num\r\n" + 
		"and tk.tt_num = tt.tt_num\r\n" + 
		"group by m.mv_title, tt.tt_scr_date, tt.tt_start, th.th_name, th.th_max";
	public MovieVO select(MovieVO vo){//한건조회
		
		
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setString(1, vo.getMvTitle());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setMvImg(rs.getString("mv_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
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
	
	public List<MovieReservationVO> RselectAll(){
		List<MovieReservationVO> Rlist = new ArrayList<>();
		
		try {
			psmt = conn.prepareStatement(SELECT_ALL_TIME_DATE_MOVIE);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				rvo = new MovieReservationVO(
						rs.getString("영화명"),
						rs.getString("상영일"),
						rs.getString("상영시작시간"),
						rs.getString("상영관"),
						rs.getInt("총좌석"),
						rs.getString("잔여좌석"));
				Rlist.add(rvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Rlist;
		
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
