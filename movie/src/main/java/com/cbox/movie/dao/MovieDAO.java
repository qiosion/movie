package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieVO;

public class MovieDAO extends DAO {
	private PreparedStatement psmt; // sql 명령문 실행
	private ResultSet rs; // select 후 결과 셋 받음
	private MovieVO vo;
	
	private final String SELECT_ALL = "select * from movie order by 1";
}
