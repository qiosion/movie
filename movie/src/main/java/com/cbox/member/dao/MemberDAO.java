package com.cbox.member.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;

import com.cbox.member.vo.MemberVO;

public class MemberDAO extends DAO{
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberVO vo;

	private final String SELECT_ALL = "SELECT * FROM MEMBER";
	private final String SELECT = "SELECT * FROM MEMBER WHERE mbr_id = ? AND mbr_pw = ?";
	private final String INSERT = "INSERT INTO MEMBER(mbr_no, mbr_id, mbr_pw, mbr_nm, mbr_birth, mbr_email, mbr_phone, mbr_e_yn)"
								+ "VALUES (mbr_seq.NEXTVAL,?,?,?,?,?,?,?)";
	//private final String UPDATE = "UPDATE MEMBER SET mbr_pw = ?, mbr_pw = ?, ADDRESS = ?, TEL = ? WHERE mbr_id = ?";
	private final String DELETE = "DELETE FROM MEMBER WHERE mbr_id = ?";
	
	public List<MemberVO> selectAll(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(SELECT_ALL); // dbms에 sql 전달
			rs = pstmt.executeQuery(); // pstmt 수행결과를 받아서 rs에 담음
			while(rs.next()) {
				vo = new MemberVO();
				vo.setMbr_no(rs.getInt("mbr_no"));
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMbr_pw(rs.getString("mbr_pw"));
				vo.setMbr_nm(rs.getString("mbr_nm")); 
				vo.setMbr_birth(rs.getDate("mbr_birth"));
				vo.setMbr_email(rs.getString("mbr_email"));
				vo.setMbr_phone(rs.getString("mbr_phone"));
				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
				vo.setMbr_point(rs.getInt("mbr_point"));
				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
				vo.setMbr_author(rs.getString("mbr_author"));
				// vo에 다 담았으면 list에 추가해주자
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public MemberVO select(MemberVO vo) {
		try {
			pstmt = conn.prepareStatement(SELECT);
			pstmt.setString(1, vo.getMbr_id());
			pstmt.setString(2, vo.getMbr_pw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMbr_no(rs.getInt("mbr_no"));
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMbr_pw(rs.getString("mbr_pw"));
				vo.setMbr_nm(rs.getString("mbr_nm")); 
				vo.setMbr_birth(rs.getDate("mbr_birth"));
				vo.setMbr_email(rs.getString("mbr_email"));
				vo.setMbr_phone(rs.getString("mbr_phone"));
				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
				vo.setMbr_point(rs.getInt("mbr_point"));
				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	public int insert(MemberVO vo) { // Member 테이블에 insert
		int n = 0;
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setInt(1, vo.getMbr_no());
			pstmt.setString(2, vo.getMbr_id());
			pstmt.setString(3, vo.getMbr_pw());
			pstmt.setString(4, vo.getMbr_nm());
			pstmt.setDate(5, vo.getMbr_birth());
			pstmt.setString(6, vo.getMbr_email());
			pstmt.setString(7, vo.getMbr_phone());
			pstmt.setString(8, vo.getMbr_e_yn());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
//	public int update(MemberVO vo) {
//		int n = 0;
//		try {
//			pstmt = conn.prepareStatement(UPDATE);
//			pstmt.setString(1, vo.getName());
//			pstmt.setString(2, vo.getPassword());
//			pstmt.setString(3, vo.getAddress());
//			pstmt.setString(4, vo.getTel());
//			pstmt.setString(5, vo.getId());
//			
//			n = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return n;
//	}
	public int delete(MemberVO vo) {
		int n = 0;
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setString(1, vo.getMbr_id());
			
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	private void close() { // 커넥션 끊어주는 close()메소드
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}