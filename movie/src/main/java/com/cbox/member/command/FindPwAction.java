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
		System.out.println("비번" + vo.getMbr_pw());
		//String pw = vo.getMbr_pw();
		//String pswd = "{\"pswd\":"+pw+"}";
		try {
		//	System.out.println("여기냐");
		//response.getWriter().print("{\"pswd\" : " + vo.getMbr_pw() + "}");
		// response.getWriter().print(pswd);
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//request.setAttribute("pw", vo.getMbr_pw());
		
		return null;
	}

}
