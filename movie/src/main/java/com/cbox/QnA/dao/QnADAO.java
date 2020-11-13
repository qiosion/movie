package com.cbox.QnA.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.QnA.vo.QnAVO;
import com.cbox.common.DAO;

public class QnADAO extends DAO {
	private PreparedStatement psmt;
	private ResultSet rs;
	private QnAVO vo;
	
	private final String SELECT_ALL = "SELECT * FROM QNA ORDER BY QA_NO";
	private final String SELECT = "SELECT * FROM QNA WHERE QA_NO=?";
	private final String INSERT = "INSERT INTO QNA(QA_NO,QA_TYPE,QA_NAME,QA_TITLE,QA_CONT,QA_DATE,qa_ad_comment)VALUES(qna_num.NEXTVAL,?,?,?,?,?,?)";
	private final String UPDATE = "UPDATE QNA SET QA_AD_NAME=?, QA_AD_COMMENT=? WHERE QA_NO=?";
	
	//리스트 조회
	public List<QnAVO> selectAll(){
		List<QnAVO> list = new ArrayList<QnAVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new QnAVO();
				vo.setQa_no(rs.getInt("qa_no"));
				vo.setQa_type(rs.getString("qa_type"));
				vo.setQa_title(rs.getString("qa_title"));
				vo.setQa_cont(rs.getString("qa_cont"));
				vo.setQa_date(rs.getDate("qa_date"));
				vo.setQa_name(rs.getString("qa_name"));
				vo.setQa_ad_name(rs.getString("qa_ad_name"));
				vo.setQa_ad_comment(rs.getString("qa_ad_comment"));
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//문의등록
	public int insert(QnAVO vo) {
		int n =0;
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getQa_type());
			psmt.setString(2, vo.getQa_name());
			psmt.setString(3, vo.getQa_title());
			psmt.setString(4, vo.getQa_cont());
			psmt.setDate(5, vo.getQa_date());
			psmt.setString(6, vo.getQa_ad_comment());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public QnAVO select(QnAVO vo) {
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setInt(1, vo.getQa_no());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setQa_no(rs.getInt("qa_no"));
				vo.setQa_type(rs.getString("qa_type"));
				vo.setQa_title(rs.getString("qa_title"));
				vo.setQa_cont(rs.getString("qa_cont"));
				vo.setQa_date(rs.getDate("qa_date"));
				vo.setQa_name(rs.getString("qa_name"));	
				vo.setQa_ad_name(rs.getString("qa_ad_name"));
				vo.setQa_ad_comment(rs.getString("qa_ad_comment"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int update(QnAVO vo) {
		int n=0;
		try {
			psmt = conn.prepareStatement(UPDATE);
			psmt.setString(1, vo.getQa_ad_name());
			psmt.setString(2, vo.getQa_ad_comment());
			psmt.setInt(3, vo.getQa_no());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	

}
