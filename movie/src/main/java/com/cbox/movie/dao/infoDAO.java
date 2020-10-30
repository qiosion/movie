package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.infoVO;

public class infoDAO extends DAO {
	private PreparedStatement psmt; //sql 명령문 실행
	private ResultSet rs; //select 후 결과셋 받기
	private infoVO vo;
	
	private final String SELECT_ALL = "SELECT * FROM INFO";
	
	public List<infoVO> selectAll(){
		List<infoVO> list = new ArrayList<infoVO>();
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new infoVO();
				vo.setInfoNum(rs.getInt("infoNum"));
				vo.setInfoTitle(rs.getString("infoTitle"));
				vo.setInfoCategory(rs.getString("infoTitle"));
				vo.setInfoDate(rs.getDate("infoDate"));
				vo.setInfoChk(rs.getInt("infoChk"));
				vo.setInfoCont(rs.getString("infoCont"));
				list.add(vo);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
