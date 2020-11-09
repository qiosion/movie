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
	private couponVO vo;
	
	private final String SELECT_ALL = "SELECT * FROM COUPON";
	private final String DELETE = "DELETE FROM COUPON WHERE CP_NO=?";
	
	public List<couponVO> selectAll(){
		List<couponVO> list = new ArrayList<couponVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new couponVO();
				vo.setCp_no(rs.getInt("cp_no"));
				vo.setCp_nm(rs.getString("cp_nm"));
				vo.setCp_valid_date(rs.getDate("cp_valid_date"));
				vo.setCp_type(rs.getString("cp_type"));
				vo.setCp_discount(rs.getInt("cp_discount"));
				list.add(vo);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(couponVO vo) {
		int n=0;
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setInt(1, vo.getCp_no());
			n = psmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	

	
	
	
}
