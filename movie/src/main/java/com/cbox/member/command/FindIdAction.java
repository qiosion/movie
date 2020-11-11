package com.cbox.member.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.FindDAO;
import com.cbox.member.vo.MemberVO;

public class FindIdAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		FindDAO dao = new FindDAO();
		MemberVO vo = new MemberVO();
		
		String nmch = request.getParameter("nmch");
		Date bdch = Date.valueOf(request.getParameter("bdch"));
		String phch = request.getParameter("phch");
		
		vo.setMbr_nm(nmch);
		vo.setMbr_birth(bdch);
		vo.setMbr_phone(phch);
		
		dao.searchId(vo);
		
		return null;
	}

}
