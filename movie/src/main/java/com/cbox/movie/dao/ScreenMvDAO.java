package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;
import com.cbox.movie.vo.ScreenMvVO;
import com.cbox.movie.vo.TheaterVO;

public class ScreenMvDAO extends DAO {

	private PreparedStatement psmt;
	private ResultSet rs;
	private ScreenMvVO vo;

	// 개봉 영화 목록
	private String SELECT_ING_MOVIE = "SELECT * FROM MOVIE WHERE MV_FINDATE>SYSDATE";

	public List<MovieVO> selectIng() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ING_MOVIE);
			rs = psmt.executeQuery();

			while (rs.next()) {
				MovieVO mvVO = new MovieVO();
				mvVO.setMvNum(rs.getInt("mv_num"));
				mvVO.setMvTitle(rs.getString("mv_title"));

				list.add(mvVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	// 상영관 목록
	private String SELECT_THEATER = "SELECT * FROM THEATER ORDER BY 1";

	public List<TheaterVO> selectTheater() {
		List<TheaterVO> list = new ArrayList<TheaterVO>();

		try {
			psmt = conn.prepareCall(SELECT_THEATER);
			rs = psmt.executeQuery();

			while (rs.next()) {
				TheaterVO thVO = new TheaterVO();
				thVO.setThNum(rs.getInt("th_num"));
				thVO.setThName(rs.getString("th_name"));
				thVO.setThMax(rs.getInt("th_max"));

				list.add(thVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	// 상영 영화 목록
	private String SELECT_LIST = "SELECT T.TT_NUM,  M.MV_TITLE, T.TT_SCR_DATE, T.TT_START, T.TT_END, TH.TH_NAME "
			+ "FROM TIMETABLE T " + "JOIN MOVIE M ON T.MV_NUM = M.MV_NUM " + "JOIN THEATER TH ON T.TH_NUM = TH.TH_NUM "
			+ "ORDER BY 2, 3, 4";

//	private String SELECT_LIST = "SELECT * FROM ( SELECT A.*, ROWNUM RN FROM ( " + 
//			"SELECT T.TT_NUM,  M.MV_TITLE, T.TT_SCR_DATE, T.TT_START, T.TT_END, TH.TH_NAME " + 
//			"FROM TIMETABLE T " + 
//			"JOIN MOVIE M ON T.MV_NUM = M.MV_NUM " + 
//			"JOIN THEATER TH ON T.TH_NUM = TH.TH_NUM " + 
//			"ORDER BY 1 ) A  ) B WHERE RN BETWEEN ? AND ?";

	public List<ScreenMvVO> getScreenList(MovieSearchVO searchVO) {
		List<ScreenMvVO> list = new ArrayList<ScreenMvVO>();
		try {
			System.out.println("getScreenList");
			psmt = conn.prepareCall(SELECT_LIST);
//			int pos = 1;
//			psmt.setInt(pos++, searchVO.getStart());
//			psmt.setInt(pos++, searchVO.getEnd());

			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new ScreenMvVO();
				vo.setTtNum(rs.getInt("tt_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setTtScrDate(rs.getString("tt_scr_date"));
				vo.setTtStart(rs.getString("tt_start"));
				vo.setTtEnd(rs.getString("tt_end"));
				vo.setThName(rs.getString("th_name"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public int count(MovieSearchVO searchVO) {
		System.out.println("count");
		int cnt = 0;
		try {
			String sql = "SELECT count(*) FROM TIMETABLE";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	// 상영 영화 상세
	private String DETAIL_MV = "SELECT T.TT_NUM,  M.MV_TITLE, T.TT_SCR_DATE, T.TT_START, T.TT_END, TH.TH_NAME "
			+ "FROM TIMETABLE T " + "JOIN MOVIE M ON T.MV_NUM = M.MV_NUM " + "JOIN THEATER TH ON T.TH_NUM = TH.TH_NUM "
			+ "WHERE T.TT_NUM = ?";

	public ScreenMvVO detailScreenMv(ScreenMvVO scVO) {
		try {
			psmt = conn.prepareStatement(DETAIL_MV);
			psmt.setInt(1, scVO.getTtNum());
			rs = psmt.executeQuery();

			if (rs.next()) {
				vo = new ScreenMvVO();
				vo.setTtNum(rs.getInt("tt_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setTtScrDate(rs.getString("tt_scr_date"));
				vo.setTtStart(rs.getString("tt_start"));
				vo.setTtEnd(rs.getString("tt_end"));
				vo.setThName(rs.getString("th_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return vo;
	}
	
	// 상영 영화 삭제
	private String DELETE_MV = "DELETE TIMETABLE WHERE TT_NUM = ?";
	
	public void deleteScreenMv(ScreenMvVO scVO) {
		try {
			System.out.println("deleteScreenMv : "+scVO.getMvNum());
			psmt = conn.prepareStatement(DELETE_MV);
			psmt.setInt(1, scVO.getTtNum());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 상영 영화 등록
//	insert into timetable
//	select 12, 2, '2021-11-11', '09:00', '10:30', th_max, 2 from theater where th_num = 2;
	private String INSERT_MV = "INSERT INTO TIMETABLE(TT_NUM, MV_NUM, TT_SCR_DATE, TT_START, TT_END, TT_EMPTY, TH_NUM) "
			+ "SELECT TIME_SEQ.NEXTVAL, ?, ?, ?, ?, TH_MAX, ? FROM THEATER WHERE TH_NUM = ?";
//			+ "values(time_seq.nextval, ?, ?, ?, ?, ?, ?";

	public void insertScreenMv(ScreenMvVO scVO) {
		try {
			System.out.println("insertScreenMv");
			psmt = conn.prepareStatement(INSERT_MV);
			System.out.println("1 : " + scVO.getMvNum());
			System.out.println("2 : " + scVO.getTtScrDate());
			System.out.println("3 : " + scVO.getTtStart());
			System.out.println("4 : " + scVO.getTtEnd());
			System.out.println("5 : " + scVO.getThNum());
			System.out.println("6 : " + scVO.getThNum());
			psmt.setInt(1, scVO.getMvNum());
			psmt.setString(2, scVO.getTtScrDate());
			psmt.setString(3, scVO.getTtStart());
			psmt.setString(4, scVO.getTtEnd());
			psmt.setInt(5, scVO.getThNum());
			psmt.setInt(6, scVO.getThNum());
			System.out.println("INSERT_MV : " + INSERT_MV);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
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