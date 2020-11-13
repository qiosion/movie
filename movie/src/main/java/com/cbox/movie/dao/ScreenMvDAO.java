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
				mvVO.setStrdate(rs.getDate("mv_strdate"));
				mvVO.setFindate(rs.getDate("mv_findate"));

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
			+ "WHERE M.MV_FINDATE >= SYSDATE ";
//	private String SELECT_LIST = "SELECT B.* FROM ( SELECT A.*, ROWNUM RN FROM (SELECT T.TT_NUM,  M.MV_TITLE, T.TT_SCR_DATE, T.TT_START, T.TT_END, TH.TH_NAME "
//			+ "FROM TIMETABLE T "
//			+ "JOIN MOVIE M ON T.MV_NUM = M.MV_NUM "
//			+ "JOIN THEATER TH ON T.TH_NUM = TH.TH_NUM "
//			+ "WHERE M.MV_FINDATE >= SYSDATE "
//			+ "ORDER BY 2, 3, 4 ) A  ) B WHERE RN BETWEEN ? AND ?";
	

	public List<ScreenMvVO> getScreenList(MovieSearchVO searchVO) {
		List<ScreenMvVO> list = new ArrayList<ScreenMvVO>();
		String whereCondition = "";
		
		if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
				&& !searchVO.getKeyword().equals("")) {
			System.out.println("type : "+searchVO.getType());
			System.out.println("keyword : "+searchVO.getKeyword());
			if (searchVO.getType().equals("title")) {
				whereCondition += " AND M.MV_TITLE LIKE '%'||?||'%'";
			}
		}
		
		try {
			SELECT_LIST = SELECT_LIST + whereCondition + "ORDER BY 2, 3, 4";
			System.out.println("getScreenList");
			psmt = conn.prepareCall(SELECT_LIST);

			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}
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
	private String DETAIL_MV = "SELECT T.TT_NUM,  M.MV_NUM, T.TT_SCR_DATE, T.TT_START, T.TT_END, TH.TH_NUM, M.MV_STRDATE, M.MV_FINDATE "
			+ "FROM TIMETABLE T " + "JOIN MOVIE M ON T.MV_NUM = M.MV_NUM " + "JOIN THEATER TH ON T.TH_NUM = TH.TH_NUM "
			+ "WHERE T.TT_NUM = ?";

	public ScreenMvVO detailScreenMv(ScreenMvVO scVO) {
		try {
			System.out.println("detailScreenMv");
			psmt = conn.prepareStatement(DETAIL_MV);
			psmt.setInt(1, scVO.getTtNum());
			rs = psmt.executeQuery();

			if (rs.next()) {
				vo = new ScreenMvVO();
				vo.setTtNum(rs.getInt("tt_num"));
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setTtScrDate(rs.getString("tt_scr_date"));
				vo.setTtStart(rs.getString("tt_start"));
				vo.setTtEnd(rs.getString("tt_end"));
				vo.setThNum(rs.getInt("th_num"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return vo;
	}

	// 상영 영화 삭제
	private String DELETE_MV = "DELETE FROM TIMETABLE WHERE TT_NUM = ?";

	public void deleteScreenMv(ScreenMvVO scVO) {
		try {
			System.out.println("deleteScreenMv : " + scVO.getTtNum());
			psmt = conn.prepareStatement(DELETE_MV);
			psmt.setInt(1, scVO.getTtNum());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// 상영 영화 중복 체크
	private String CHECK_MV = "SELECT T.* "
			+ "FROM TIMETABLE T, MOVIE M "
			+ "WHERE T.MV_NUM = M.MV_NUM "
			+ "AND M.MV_FINDATE >= SYSDATE "
			+ "AND T.MV_NUM = ? AND T.TT_SCR_DATE = ? AND T.TH_NUM = ? AND T.TT_START = ?";
	
	public String checkDupl(ScreenMvVO scVO) {
		String result = "N";
		try {
			psmt = conn.prepareStatement(CHECK_MV);
			psmt.setInt(1, scVO.getMvNum());
			psmt.setString(2, scVO.getTtScrDate());
			psmt.setInt(3, scVO.getThNum());
			psmt.setString(4, scVO.getTtStart());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = "Y";	// 중복
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 상영 영화 등록
//	insert into timetable
//	select 12, 2, '2021-11-11', '09:00', '10:30', th_max, 2 from theater where th_num = 2;
	private String INSERT_MV = "INSERT INTO TIMETABLE(TT_NUM, MV_NUM, TT_SCR_DATE, TT_START, TT_END, TT_EMPTY, TH_NUM) "
			+ "SELECT TIME_SEQ.NEXTVAL, ?, ?, ?, ?, TH_MAX, ? FROM THEATER WHERE TH_NUM = ?";

	public void insertScreenMv(ScreenMvVO scVO) {
		try {
			System.out.println("insertScreenMv");
			psmt = conn.prepareStatement(INSERT_MV);
			psmt.setInt(1, scVO.getMvNum());
			psmt.setString(2, scVO.getTtScrDate());
			psmt.setString(3, scVO.getTtStart());
			psmt.setString(4, scVO.getTtEnd());
			psmt.setInt(5, scVO.getThNum());
			psmt.setInt(6, scVO.getThNum());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 상영 영화 수정
	private String UPDATE_MV = "UPDATE TIMETABLE SET TT_SCR_DATE = ?, TT_START = ?, TT_END = ?, TH_NUM = ?, "
			+ "TT_EMPTY = (SELECT TH_MAX FROM THEATER WHERE TH_NUM = ?) " + "WHERE TT_NUM=?";

	public void updateScreenMv(ScreenMvVO scVO) {
		System.out.println("updateScreenMv");

		try {
			psmt = conn.prepareStatement(UPDATE_MV);
			psmt.setString(1, scVO.getTtScrDate());
			psmt.setString(2, scVO.getTtStart());
			psmt.setString(3, scVO.getTtEnd());
			psmt.setInt(4, scVO.getThNum());
			psmt.setInt(5, scVO.getThNum());
			psmt.setInt(6, scVO.getTtNum());
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// 등록된 상영 영화 조회
	private String REGI_CHECK = "SELECT * FROM TIMETABLE WHERE MV_NUM=?";
	public String regiChk(MovieVO vo) {
		String result = "N";
		
		try {
			psmt = conn.prepareStatement(REGI_CHECK);
			psmt.setInt(1, vo.getMvNum());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("등록된게 있따.");
				result = "Y";
			} else {
				System.out.println("등록된게 없다.");
				result = "N";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
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