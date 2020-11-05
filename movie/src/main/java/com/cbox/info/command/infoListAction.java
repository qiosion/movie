package com.cbox.info.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.common.Paging;
import com.cbox.info.dao.infoDAO;
import com.cbox.info.vo.infoVO;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class infoListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//게시판리스트 보기
		infoDAO dao = new infoDAO();
		
		
		List<infoVO> list = new ArrayList<infoVO>();
		
		//페이지번호 파라미터
		String strp = request.getParameter("p");
		//페이지번호가 없으면 1로초기화
		int p = 1;
		if(strp != null && ! strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		//레코드건수 조회
		Paging paging = new Paging();
		paging.setPageUnit(2); //레코드 수
		paging.setPageSize(5);//한페이지에 출력 할 페이지 번호수
		paging.setPage(p);
		MemberDAO cntdao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		paging.setTotalRecord(cntdao.count(vo));
		// 페이징 객체를 저장
		request.setAttribute("paging", paging);
		
		
		
		
		list = dao.selectAll();
		request.setAttribute("infoList", list);//list를 infoList라는 변수로 사용
		
		return "jsp/user/info/infoList.jsp";
	}

}
