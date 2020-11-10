package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.reservation.vo.UserReservVO;

public class UserReservDAO extends DAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private UserReservVO uvo;
	
	private String SELECT_RESERV_LIST = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM ( " + 
					"SELECT TC.TC_NUM, MV.MV_TITLE, TT.TT_SCR_DATE, " + 
					"TT.TT_START, TC.TC_ST_NUM, TH.TH_NAME FROM TICKETING TC " + 
					"JOIN TIMETABLE TT ON TT.TT_NUM = TC.TT_NUM " + 
					"JOIN MOVIE MV ON MV.MV_NUM = TT.MV_NUM " + 
					"JOIN THEATER TH ON TH.TH_NUM = TT.TH_NUM " + 
					"JOIN MEMBER MBR ON MBR.MBR_NO = TC.MBR_NO " + 
					"WHERE MBR.MBR_NO = ? )A )B WHERE RN BETWEEN ? AND ?";
	private String COUNT_RESERV = "SELECT COUNT(TC.TC_NUM) " + 
						"FROM TICKETING TC, MEMBER MBR " + 
						"WHERE MBR.MBR_NO = ?";
	
	public List<UserReservVO> userReserv_list(UserReservVO uvo){
		List<UserReservVO> list = new ArrayList<UserReservVO>();
		try {
			pstmt = conn.prepareStatement(SELECT_RESERV_LIST);
			pstmt.setInt(1, uvo.getMbr_no());
			pstmt.setInt(2, uvo.getFirst());
			pstmt.setInt(3, uvo.getLast());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				uvo = new UserReservVO();
				uvo.setMbr_no(rs.getInt("mbr_no"));
				uvo.setMv_title(rs.getString("mv_title"));
				uvo.setTt_scr_date(rs.getString("tt_scr_date"));
				uvo.setTt_start(rs.getString("tt_start")); 
				uvo.setTc_st_num(rs.getString("tc_st_num"));
				uvo.setTh_name(rs.getString("th_name"));
				uvo.setTc_num(rs.getInt("tc_num"));
				list.add(uvo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public int count(UserReservVO uvo) {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(COUNT_RESERV);
			System.out.println("여기서도 세션에서 번호 받아오나?" + uvo.getMbr_no());
			pstmt.setInt(1, uvo.getMbr_no());
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
