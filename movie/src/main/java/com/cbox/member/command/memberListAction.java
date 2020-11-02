package com.cbox.member.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.common.Paging;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memberListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		String strp = request.getParameter("p");
		
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		
		Paging paging = new Paging();
		paging.setPage(p);
		
		MemberDAO cntdao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		paging.setTotalRecord(cntdao.count(vo));
		request.setAttribute("paging", paging);
		list = dao.member_list(vo);
		request.setAttribute("members", list);
		return "jsp/admin/member/memberList.jsp";
	}

}
