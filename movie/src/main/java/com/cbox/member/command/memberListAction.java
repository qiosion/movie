package com.cbox.member.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memberListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = dao.selectAll();
		request.setAttribute("members", list);
		return "jsp/user/member/memberList.jsp";
	}

}
