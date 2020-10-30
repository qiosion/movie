package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieVO;

public class MovieDAO extends DAO {

	private PreparedStatement psmt;
	private ResultSet rs;
	private MovieVO vo;

	private final String SELECT_ALL = "select * from movie order by 1";

	public List<MovieVO> selectAll() {
		System.out.println("selectall");
		List<MovieVO> list = new ArrayList<MovieVO>();

		try {
			System.out.println("selectall try");
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDiv(rs.getString("mv_div"));
				vo.setMvCom(rs.getString("mv_com"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("strdate"));
				vo.setFindate(rs.getDate("findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvRank(rs.getInt("mv_rank"));

				System.out.println(">> " + vo.getMvTitle());
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	// 모든 동작 후 연결 끊어주기
	private void close() {
		try {
			// 열어준거의 반대방향으로 닫아준다.
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
