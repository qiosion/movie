package com.cbox.info.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.info.vo.infoVO;

public class infoDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과셋 받기
	private infoVO vo;

	private final String SELECT_ALL = "SELECT * FROM INFO";
	private final String INSERT = "INSERT INTO INFO(INFO_NUM,INFO_TITLE,INFO_DATE,INFO_CATEGORY,INFO_CONT)VALUES(?,?,?,?,?)";
	private final String SELECT = "SELECT * FROM INFO WHERE INFO_NUM=?";
	private final String DELETE = "DELETE FROM INFO WHERE INFO_NUM = ?";
	private final String UPDATE = "UPDATE INFO SET INFO_TITLE=?, INFO_DATE=SYSDATE, INFO_CATEGORY=?, INFO_CONT=? WHERE INFO_NUM=?";
	private final String UPDATECHK = "UPDATE INFO SET INFO_CHK=INFO_CHK+1 WHERE INFO_NUM=?";
	public List<infoVO> selectAll() {
		List<infoVO> list = new ArrayList<infoVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new infoVO();
				vo.setInfo_Num(rs.getInt("info_Num"));
				vo.setInfo_Title(rs.getString("info_Title"));
				vo.setInfo_Category(rs.getString("info_Category"));
				vo.setInfo_Date(rs.getDate("info_Date"));
				vo.setInfo_Chk(rs.getInt("info_Chk"));
				vo.setInfo_Cont(rs.getString("info_Cont"));
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int insert(infoVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setInt(1, vo.getInfo_Num());
			psmt.setString(2, vo.getInfo_Title());
			psmt.setDate(3, vo.getInfo_Date());
			psmt.setString(4, vo.getInfo_Category());
			psmt.setString(5, vo.getInfo_Cont());
			n = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public infoVO select(infoVO vo) {
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setInt(1, vo.getInfo_Num());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setInfo_Num(rs.getInt("info_Num"));
				vo.setInfo_Title(rs.getString("info_Title"));
				vo.setInfo_Category(rs.getString("info_Category"));
				vo.setInfo_Cont(rs.getString("info_Cont"));
				vo.setInfo_Date(rs.getDate("info_Date"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int update(infoVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE);
			psmt.setString(1, vo.getInfo_Title());
			psmt.setString(2,vo.getInfo_Category());
			psmt.setString(3,vo.getInfo_Cont());
			psmt.setInt(4, vo.getInfo_Num());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int updateChk(infoVO vo) {
		int n= 0;
		try {
			psmt = conn.prepareStatement(UPDATECHK);
			psmt.setInt(1, vo.getInfo_Num());
			n = psmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
		
	}
	
	
	
	public int delete(infoVO vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setInt(1, vo.getInfo_Num());
			n = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
}
