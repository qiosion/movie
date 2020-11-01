package com.cbox.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cbox.common.Action;

public class logoutAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mbr_id = (String) session.getAttribute("mbr_id");
		session.invalidate();
		request.setAttribute("mbr_id", mbr_id);
		return "main.jsp";
	}
}
