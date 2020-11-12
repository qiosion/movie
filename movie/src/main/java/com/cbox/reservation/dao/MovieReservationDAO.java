package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieVO;
import com.cbox.reservation.vo.MovieReservationVO;
import com.cbox.reservation.vo.MvFindDateDTO;
import com.cbox.reservation.vo.MvFindImgDTO;
import com.cbox.reservation.vo.mvFindDateVO;

public class MovieReservationDAO extends DAO {

	
	private PreparedStatement psmt;
	private ResultSet rs;

	private MovieVO vo;
	private mvFindDateVO mfvo;
	private MovieReservationVO rvo;
	private MvFindImgDTO idto;
	
	private final String SELECT_TITLE_IMG = 
			"SELECT MV_NUM, MV_TITLE, MV_POST\r\n" + 
			"FROM MOVIE\r\n" + 
			"WHERE MV_NUM=?";				
	private final String SELECT_ID_DATE_TIME = 
			"select tt.tt_num \"상영번호\", tt.mv_num \"영화번호\", tt.tt_scr_date \"영화상영일\", tt.tt_start \"시작시간\", tt.tt_end \"종료시간\", th.th_max \"총좌석\", th.th_name \"상영관명\"\r\n" + 
			",       (th.th_max- nvl((select sum(tc.tc_ppl)        from ticketing tc        where  tc.tt_num=tt.tt_num ),0)) as \"잔여좌석\"\r\n" + 
			"from timetable tt, theater th\r\n" + 
			"where tt.th_num = th.th_num\r\n" + 
			"and tt.mv_num= ?\r\n" + 
			"and tt.tt_scr_date = ?\r\n" + 
			"order by tt.tt_start";
private final String SELECT_M_DATE = "select distinct(tt_scr_date), mv_num\r\n" + 
									 "from timetable\r\n" + 
									 "where mv_num = ?";
private final String SELECT_ALL = "SELECT * FROM MOVIE";
private final String SELECT_ALL_TIME_DATE_MOVIE = 
		"select m.mv_title \"영화명\", tt.tt_scr_date \"상영일\", tt.tt_start \"상영시작시간\", th.th_name \"상영관\", th.th_max \"총좌석\" ,(th.th_max-count(*)) \"잔여좌석\"\r\n" + 
		"from movie m, timetable tt, theater th, ticketing tk\r\n" + 
		"where m.mv_num = tt.mv_num\r\n" + 
		"and tt.th_num = th.th_num\r\n" + 
		"and tk.tt_num = tt.tt_num\r\n" + 
		"group by m.mv_title, tt.tt_scr_date, tt.tt_start, th.th_name, th.th_max";
	
	public List<MvFindImgDTO> selectMvImg(MvFindImgDTO dto){//id값으로 이미지, 영화명찾기
		List<MvFindImgDTO> list = new ArrayList<>();
		
		try {
			psmt = conn.prepareStatement(SELECT_TITLE_IMG);
			psmt.setInt(1, dto.getMv_num());
			rs= psmt.executeQuery();
			if(rs.next()) {
				idto = new MvFindImgDTO();
				idto.setMv_title(rs.getString("mv_title"));
				idto.setMv_post(rs.getString("mv_post"));
				list.add(idto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<MvFindDateDTO> selectMvTime(MvFindDateDTO dto){// 2020-11-08 다시해야됨 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		List<MvFindDateDTO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(SELECT_ID_DATE_TIME);
			psmt.setInt(1, dto.getM_id());
			psmt.setString(2, dto.getM_date());
			rs = psmt.executeQuery();
			while(rs.next()) {
				MvFindDateDTO mdto = new MvFindDateDTO();
				mdto.setTt_num(rs.getInt("상영번호"));
				mdto.setTt_start(rs.getString("시작시간"));
				mdto.setTt_end(rs.getString("종료시간"));
				mdto.setTh_max(rs.getInt("총좌석"));
				mdto.setTh_name(rs.getString("상영관명"));
				mdto.setTt_empty(rs.getInt("잔여좌석"));
				list.add(mdto);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return list;
	}
	
	
	public List<mvFindDateVO> selectMvDate(mvFindDateVO vo) { //id에 맞는 영화 상영일 찾아오기
		List<mvFindDateVO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(SELECT_M_DATE);
			psmt.setInt(1, vo.getId());
			rs = psmt.executeQuery();
			while(rs.next()) {//조회한 결과가 있는건수만큼 돌릴꺼임
				mfvo = new mvFindDateVO();
					mfvo.setTt_scr_date(rs.getString("tt_scr_date"));
					mfvo.setId(rs.getInt("mv_num"));
					list.add(mfvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	} // end selectMvDate

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
						rs.getDouble("mv_rank"),
						rs.getString("mv_age"));
				list.add(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	public List<MovieReservationVO> RselectAll(){ //예매하기 시간 관련 정보 출력
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
