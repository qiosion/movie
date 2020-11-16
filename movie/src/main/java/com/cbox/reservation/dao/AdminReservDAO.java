package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.reservation.vo.AdminReservVO;
import com.cbox.reservation.vo.SearchVo;

public class AdminReservDAO extends DAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AdminReservVO vo;
	
	private String ADMIN_RESERV_ALL = "";
	private String RESERV_FROM_TODAY = "";
	private String COUNT_RESERV = "SELECT COUNT(TC_NUM) FROM TICKETING";

	public List<AdminReservVO> AdminReservList(SearchVo svo) {
		List<AdminReservVO> list = new ArrayList<AdminReservVO>();
		String whereCondition = " WHERE 1=1";
		if (svo.getType() != null && !svo.getType().equals("") && svo.getKeyword() != null
				&& !svo.getKeyword().equals("")) {
			if (svo.getType().equals("id")) {
				whereCondition += "AND MBR_ID LIKE '%'||?||'%' ";
			}
		}
		try {
			ADMIN_RESERV_ALL = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM ( " + 
					"SELECT TC.TC_NUM, MBR.MBR_ID, MV.MV_TITLE, TT.TT_SCR_DATE, " + 
					"TT.TT_START, TC.TC_ST_NUM, TH.TH_NAME FROM TICKETING TC " + 
					"JOIN TIMETABLE TT ON TT.TT_NUM = TC.TT_NUM " + 
					"JOIN MOVIE MV ON MV.MV_NUM = TT.MV_NUM " + 
					"JOIN THEATER TH ON TH.TH_NUM = TT.TH_NUM " + 
					"JOIN MEMBER MBR ON MBR.MBR_NO = TC.MBR_NO " + whereCondition +
					"ORDER BY TT.TT_SCR_DATE, TT.TT_START DESC )A )B WHERE RN BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(ADMIN_RESERV_ALL);
			
			int pos = 1;
			if (svo.getType() != null && !svo.getType().equals("") && svo.getKeyword() != null
					&& !svo.getKeyword().equals("")) {
				if (svo.getType().equals("id")) {
					pstmt.setString(pos++, svo.getKeyword());
				}
			}
			pstmt.setInt(pos++, svo.getFirst());
			pstmt.setInt(pos++, svo.getLast());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new AdminReservVO();
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMv_title(rs.getString("mv_title"));
				vo.setTt_scr_date(rs.getString("tt_scr_date"));
				vo.setTt_start(rs.getString("tt_start")); 
				vo.setTc_st_num(rs.getString("tc_st_num"));
				vo.setTh_name(rs.getString("th_name"));
				vo.setTc_num(rs.getString("tc_num"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public List<AdminReservVO> ReservFromTodayList(SearchVo svo) {
		List<AdminReservVO> list = new ArrayList<AdminReservVO>();
		String whereCondition = "";
		if (svo.getType() != null && !svo.getType().equals("") && svo.getKeyword() != null
				&& !svo.getKeyword().equals("")) {
			if (svo.getType().equals("id")) {
				whereCondition += "AND MBR_ID LIKE '%'||?||'%' ";
			}
		}
		try {
			RESERV_FROM_TODAY = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM ( " + 
					"SELECT TC.TC_NUM, MBR.MBR_ID, MV.MV_TITLE, TT.TT_SCR_DATE, " + 
					"TT.TT_START, TC.TC_ST_NUM, TH.TH_NAME FROM TICKETING TC " + 
					"JOIN TIMETABLE TT ON TT.TT_NUM = TC.TT_NUM " + 
					"JOIN MOVIE MV ON MV.MV_NUM = TT.MV_NUM " + 
					"JOIN THEATER TH ON TH.TH_NUM = TT.TH_NUM " + 
					"JOIN MEMBER MBR ON MBR.MBR_NO = TC.MBR_NO " +
					"WHERE TO_DATE(TT.TT_SCR_DATE) >= TO_CHAR(SYSDATE,'YYYYMMDD') "+
					whereCondition + "ORDER BY TT.TT_SCR_DATE, TT.TT_START )A )B " +
					"WHERE RN BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(RESERV_FROM_TODAY);
			int pos = 1;
			if (svo.getType() != null && !svo.getType().equals("") && svo.getKeyword() != null
					&& !svo.getKeyword().equals("")) {
				if (svo.getType().equals("id")) {
					pstmt.setString(pos++, svo.getKeyword());
				}
			}
			pstmt.setInt(pos++, svo.getFirst());;
			pstmt.setInt(pos++, svo.getLast());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new AdminReservVO();
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMv_title(rs.getString("mv_title"));
				vo.setTt_scr_date(rs.getString("tt_scr_date"));
				vo.setTt_start(rs.getString("tt_start")); 
				vo.setTc_st_num(rs.getString("tc_st_num"));
				vo.setTh_name(rs.getString("th_name"));
				vo.setTc_num(rs.getString("tc_num"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int count(SearchVo svo) {
		int cnt = 0;
		try {
			String whereCondition = " WHERE 1=1";
			if (svo.getType() != null && !svo.getType().equals("") && svo.getKeyword() != null
					&& !svo.getKeyword().equals("")) {
				if (svo.getType().equals("id")) {
					whereCondition += " AND MBR_ID AND '%'||?||'%'";
				}
			}
			String sql = COUNT_RESERV + whereCondition;
			pstmt = conn.prepareStatement(sql);
			
			int pos = 1;
			if (svo.getType() != null && !svo.getType().equals("") && svo.getKeyword() != null
					&& !svo.getKeyword().equals("")) {
				if (svo.getType().equals("id")) {
					pstmt.setString(pos++, svo.getKeyword());
				}
			}
			
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	private void close() {
		try {
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
