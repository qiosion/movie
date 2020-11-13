package com.cbox.member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.member.dao.FindDAO;
import com.cbox.member.vo.MemberVO;

public class FindPwAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberVO vo = new MemberVO();
		
		String mbr_id = request.getParameter("mbr_id");
		String mbr_nm = request.getParameter("mbr_nm");
		String mbr_phone = request.getParameter("mbr_phone");
		
		vo.setMbr_id(mbr_id);
		vo.setMbr_nm(mbr_nm);
		vo.setMbr_phone(mbr_phone);
		
		FindDAO dao = new FindDAO();
		vo = dao.searchPw(vo);
		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
