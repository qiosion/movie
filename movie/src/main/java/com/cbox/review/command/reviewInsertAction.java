package com.cbox.review.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.movie.vo.ReviewVO;
import com.cbox.review.dao.ReviewDAO;

public class reviewInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ReviewVO vo = new ReviewVO();
		ReviewDAO dao = new ReviewDAO();
		System.out.println("쩜두");
		vo.setRvRank(Double.parseDouble(request.getParameter("revRank")));
		vo.setRvCont(request.getParameter("revCont"));
		vo.setMbrNum(Integer.parseInt(request.getParameter("hdnNo")));
		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		
		int n = dao.insert(vo);
		if (n != 0) { // n이 0이 아니면 성공
			response.setContentType("text/html; charset=UTF-8");
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('리뷰 등록 완료');</script>");
				out.println("<script>location.href='UserReservList.do';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("등록에 실패하였습니다");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
