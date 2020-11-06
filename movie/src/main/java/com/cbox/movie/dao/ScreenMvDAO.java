package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
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
		System.out.println("selectIng");
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
		System.out.println("selectTheater");
		List<TheaterVO> list = new ArrayList<TheaterVO>();

		try {
			psmt = conn.prepareCall(SELECT_THEATER);
			rs = psmt.executeQuery();

			System.out.println("try");
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
			+ "ORDER BY 1";

	public List<ScreenMvVO> getScreenList() {
		List<ScreenMvVO> list = new ArrayList<ScreenMvVO>();
		try {
			psmt = conn.prepareCall(SELECT_LIST);
			System.out.println("getScreenList");

			rs = psmt.executeQuery();
			while (rs.next()) {
				System.out.println("????? " + rs.getInt("tt_num"));
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

//
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