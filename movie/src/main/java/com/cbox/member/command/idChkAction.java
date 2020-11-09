package com.cbox.member.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.IdChkDAO;

public class idChkAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		IdChkDAO dao = IdChkDAO.getInstance();
		
		String id = request.getParameter("mbr_id");
		boolean result = dao.idChk(id);
		try {
			PrintWriter out = response.getWriter();
			if (result) {
				out.println("0");
			} else {
				out.println("1");
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
