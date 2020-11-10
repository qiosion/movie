package com.cbox.coupon.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.coupon.vo.couponVO;

public class couponDAO extends DAO{
	private PreparedStatement psmt;
	private ResultSet rs;
	
	static couponDAO couponDAO = new couponDAO();
	public static couponDAO getInstance() {
		return couponDAO;
	}
	
	
	private final String SELECT_ALL = "SELECT * FROM COUPON";
	private final String SELECT ="SELECT * FROM COUPON WHERE CP_NO=?";
	private final String DELETE = "DELETE FROM COUPON WHERE CP_NO=?";
	private final String INSERT = "INSERT INTO COUPON(CP_NO,CP_NM,_CP_VAILD_DATE,CP_TYPE,CP_DISCOUNT)";
	//목록 조회
	public List<couponVO> selectAll(){
		List<couponVO> couponList = new ArrayList<couponVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs=psmt.executeQuery();
			while(rs.next()) {
				couponVO coupon = new couponVO();
				coupon.setCp_no(rs.getString("cp_no"));
				coupon.setCp_nm(rs.getString("cp_nm"));
				coupon.setCp_vaild_date(rs.getDate("cp_vaild_date"));
				coupon.setCp_type(rs.getString("cp_type"));
				coupon.setCp_discount(rs.getInt("cp_discount"));
				couponList.add(coupon);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return couponList;
	}
	
	//상세조회
	public couponVO select(couponVO vo) {
		couponVO coupon = null;
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setString(1, vo.getCp_no());
			rs=psmt.executeQuery();
			if(rs.next()) {
				coupon = new couponVO();
				coupon.setCp_no(rs.getString("cp_no"));
				coupon.setCp_nm(rs.getString("cp_nm"));
				coupon.setCp_vaild_date(rs.getDate("cp_vaild_date"));
				coupon.setCp_type(rs.getString("cp_type"));
				coupon.setCp_discount(rs.getInt("cp_discount"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return coupon;
	}
	
	//쿠폰 삭제
	public void delete(couponVO vo) {
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setString(1, vo.getCp_no());
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	//쿠폰 등록
	public void insert(couponVO vo) {
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getCp_no());
			psmt.setString(2, vo.getCp_nm());
			psmt.setDate(3, vo.getCp_vaild_date());
			psmt.setString(4, vo.getCp_type());
			psmt.setInt(5, vo.getCp_discount());
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	
	public void close() {
    	if(conn != null) {
    		try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	}
    }
	
	

	
	
	
}
