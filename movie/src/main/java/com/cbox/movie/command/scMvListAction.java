package com.cbox.movie.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.common.Paging;
import com.cbox.movie.dao.ScreenMvDAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.ScreenMvVO;

public class scMvListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ScreenMvVO> list = new ArrayList<ScreenMvVO>();
		ScreenMvDAO dao = new ScreenMvDAO();

		System.out.println("scMvListAction");
		String strp = request.getParameter("p");
		System.out.println("strp : " + strp);

		// 파라미터가 null이면 1로 초기화
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}

		// 전체 레코드 건수 조회
		Paging paging = new Paging();
		paging.setPage(p); // 현재 페이지
		System.out.println(">>page : "+paging.getPage());
		paging.setPageUnit(5); // 한 페이지에 출력할 레코드 건수. default:10
		paging.setPageSize(5); // 페이지 번호 수. default:10
		System.out.println(">>unit : "+paging.getPageUnit());
		System.out.println(">>size : "+paging.getPageSize());

		MovieSearchVO searchVO = new MovieSearchVO();

		request.setAttribute("paging", paging);

		System.out.println(">> first : "+paging.getFirst());
		System.out.println(">> last : "+paging.getLast());
		// searchVO에 담기
		searchVO.setStart(paging.getFirst());
		searchVO.setEnd(paging.getLast());
		System.out.println("start : "+searchVO.getStart());
		System.out.println("end : "+searchVO.getEnd());

		ScreenMvDAO cntdao = new ScreenMvDAO();
		paging.setTotalRecord(cntdao.count(searchVO));

		list = dao.getScreenList(searchVO);

		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}
