package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.reservation.vo.AdminReservVO;
import com.cbox.reservation.vo.UserReservVO;

public class AdminReservDAO extends DAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AdminReservVO vo;
	
	private String ADMIN_RESERV_LIST = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM ( " + 
			"SELECT TC.TC_NUM, MBR.MBR_ID, MV.MV_TITLE, TT.TT_SCR_DATE, " + 
			"TT.TT_START, TC.TC_ST_NUM, TH.TH_NAME FROM TICKETING TC " + 
			"JOIN TIMETABLE TT ON TT.TT_NUM = TC.TT_NUM " + 
			"JOIN MOVIE MV ON MV.MV_NUM = TT.MV_NUM " + 
			"JOIN THEATER TH ON TH.TH_NUM = TT.TH_NUM " + 
			"JOIN MEMBER MBR ON MBR.MBR_NO = TC.MBR_NO " + 
			"ORDER BY TC.TC_NUM )A )B WHERE RN BETWEEN ? AND ?";
	private String COUNT_RESERV = "SELECT COUNT(TC_NUM) FROM TICKETING";

	public List<AdminReservVO> AdminReservList(AdminReservVO avo) {
		List<AdminReservVO> list = new ArrayList<AdminReservVO>();
		try {
			pstmt = conn.prepareStatement(ADMIN_RESERV_LIST);
			pstmt.setInt(1, avo.getFirst());;
			pstmt.setInt(2, avo.getLast());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new AdminReservVO();
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMv_title(rs.getString("mv_title"));
				vo.setTt_scr_date(rs.getString("tt_scr_date"));
				vo.setTt_start(rs.getString("tt_start")); 
				vo.setTc_st_num(rs.getString("tc_st_num"));
				vo.setTh_name(rs.getString("th_name"));
				vo.setTc_num(rs.getInt("tc_num"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	public int count(AdminReservVO avo) {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(COUNT_RESERV);
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
