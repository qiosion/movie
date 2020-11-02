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

	private final String SELECT_ALL = "select * from movie order by 1";
	private final String SELECT_EXPECTED = "select * from movie where mv_strdate > sysdate";	// 상영 예정작
	private final String SELECT_SEARCH = "select * from movie where mv_title like '%'||?||'%' order by 1";
	private final String DETAIL = "select * from movie where mv_num = ?";

	public List<MovieVO> selectAll(MovieVO vo) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		String searchYn = "N";

		System.out.println("type : " + vo.getSearchType());
		System.out.println("keyword : " + vo.getSearchKeyword());
		try {
			if (vo.getSearchType() != null && vo.getSearchKeyword() != null) {
				searchYn = "Y"; // 검색 o
			}
			System.out.println("searchYn : " + searchYn);

			if (searchYn.equals("Y") && vo.getSearchType().equals("title")) {
				System.out.println("title search");
				psmt = conn.prepareStatement(SELECT_SEARCH);
				psmt.setString(1, vo.getSearchKeyword());
			} else {
				psmt = conn.prepareStatement(SELECT_ALL);
			}

			rs = psmt.executeQuery();

			while (rs.next()) {
				System.out.println(">>> " + rs.getInt("mv_num"));
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCom(rs.getString("mv_com"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				
				// todo : 평균 평점은 해당 영화번호를 가진 review들의 평점을 계산해서
				vo.setMvRank(rs.getInt("mv_rank"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	public List<MovieVO> selectExpect(MovieVO vo) {
		System.out.println("selectExpect");
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			psmt = conn.prepareStatement(SELECT_EXPECTED);
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCom(rs.getString("mv_com"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				
				// todo : 평균 평점은 해당 영화번호를 가진 review들의 평점을 계산해서
//				vo.setMvRank(rs.getInt("mv_rank"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public MovieVO getMovieDetail(MovieVO vo) {
		System.out.println("detail : " + vo.getMvNum());
		try {
			psmt = conn.prepareStatement(DETAIL);
			psmt.setInt(1, vo.getMvNum());

			rs = psmt.executeQuery();

			if (rs.next()) {
//				vo.setMvNum(rs.getInt("mv_num"));
				System.out.println("detail dao : " + rs.getString("mv_title"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCom(rs.getString("mv_com"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvRank(rs.getInt("mv_rank"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
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
