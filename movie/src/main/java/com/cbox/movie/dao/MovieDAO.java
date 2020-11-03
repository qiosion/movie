package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;

public class MovieDAO extends DAO {

	private PreparedStatement psmt;
	private ResultSet rs;
	private MovieVO vo;

	private String SELECT_ALL = "select * from movie";
//	private final String SELECT_PAGE = "select * from ( select a.*, rownum rn from (" + "select * from movie order by 1"
//			+ ") a  ) b where rn between ? and ?";
	private String SELECT_SEARCH = "";
	private String SELECT_EXPECTED = "select * from movie where mv_strdate > sysdate"; // 상영 예정작
	private final String DETAIL = "select * from movie where mv_num = ?";

	public List<MovieVO> selectAll(MovieSearchVO searchVO) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		String whereCondition = " where 1=1";

		if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
				&& !searchVO.getKeyword().equals("")) {
			if (searchVO.getType().equals("title")) {
				System.out.println("title?");
				whereCondition += " and mv_title like '%'||?||'%'";
			}
		}
		try {
			SELECT_ALL = SELECT_ALL + whereCondition;
			psmt = conn.prepareStatement(SELECT_ALL);

			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}
			rs = psmt.executeQuery();

			while (rs.next()) {
				System.out.println(">>> " + rs.getInt("mv_num"));
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvAge(rs.getString("mv_age"));

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

	public List<MovieVO> selectPage(MovieSearchVO searchVO) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		String whereCondition = " where 1=1";
		if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
				&& !searchVO.getKeyword().equals("")) {
			if (searchVO.getType().equals("title")) {
				System.out.println("title?");
				whereCondition += " and mv_title like '%'||?||'%'";
			}
		}

		try {
			System.out.println(">>where : " + whereCondition);
			SELECT_SEARCH = "select * from ( select a.*, rownum rn from ( " + "select * from movie" + whereCondition
					+ " order by 1 ) a  ) b where rn between ? and ?";
			System.out.println(">>search : " + SELECT_SEARCH);
			psmt = conn.prepareStatement(SELECT_SEARCH);
//			psmt = conn.prepareStatement(SELECT_PAGE);
//			psmt.setInt(1, searchVO.getFirst());
//			psmt.setInt(2, searchVO.getLast());
			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}
			psmt.setInt(pos++, searchVO.getStart());
			psmt.setInt(pos++, searchVO.getEnd());
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvAge(rs.getString("mv_age"));

				// todo : 평균 평점은 해당 영화번호를 가진 review들의 평점을 계산해서
				vo.setMvRank(rs.getInt("mv_rank"));

				System.out.println(">>>>>>>>> " + rs.getNString("mv_title"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public int count(MovieSearchVO searchVO) { // 전체 건수 조회
		int cnt = 0;
		try {
			String whereCondition = " where 1=1";
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					whereCondition += " and mv_title and '%'||?||'%'";
				}
			}
			String sql = "select count(*) from movie" + whereCondition;
			psmt = conn.prepareStatement(sql);

			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}

			rs = psmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1); // 첫번쨰열. 카운트 결과
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public List<MovieVO> selectExpect(MovieSearchVO searchVO) {
		System.out.println("selectExpect");
		List<MovieVO> list = new ArrayList<MovieVO>();
		String whereCondition = "";

		if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
				&& !searchVO.getKeyword().equals("")) {
			if (searchVO.getType().equals("title")) {
				System.out.println("title?");
				whereCondition += " and mv_title like '%'||?||'%'";
			}
		}

		try {
			SELECT_EXPECTED = SELECT_EXPECTED + whereCondition;
			psmt = conn.prepareStatement(SELECT_EXPECTED);

			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvAge(rs.getString("mv_age"));

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
				vo.setMvAge(rs.getString("mv_age"));
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
