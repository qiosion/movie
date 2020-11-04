package com.cbox.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.common.Paging;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;

public class mvListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		MovieDAO dao = new MovieDAO();
		List<MovieVO> list = new ArrayList<MovieVO>();

		// 페이지 번호 파라미터
		String strp = request.getParameter("p");

		// 파라미터가 null이면 1로 초기화
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}

		// 전체 레코드 건수 조회
		Paging paging = new Paging();
		paging.setPage(p); // 현재 페이지
		paging.setPageUnit(5); // 한 페이지에 출력할 레코드 건수. default:10
		paging.setPageSize(5); // 페이지 번호 수. default:10

		MovieSearchVO searchVO = new MovieSearchVO();

		request.setAttribute("paging", paging);

		// searchVO에 담기
		searchVO.setStart(paging.getFirst());
		searchVO.setEnd(paging.getLast());
		searchVO.setType(request.getParameter("searchType"));
		searchVO.setKeyword(request.getParameter("keyword"));

		MovieDAO cntdao = new MovieDAO();
		paging.setTotalRecord(cntdao.count(searchVO));
		list = dao.selectPage(searchVO);

		request.setAttribute("movies", list);

		return "jsp/admin/movie/movieList.jsp";
	}
}