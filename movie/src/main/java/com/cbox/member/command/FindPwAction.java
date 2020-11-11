package com.cbox.member.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.member.dao.FindDAO;
import com.cbox.member.vo.MemberVO;

public class FindPwAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		FindDAO dao = new FindDAO();
		MemberVO vo = new MemberVO();
		
		String idchk = request.getParameter("idchk");
		String nmchk = request.getParameter("nmchk");
		String phchk = request.getParameter("phchk");
		
		vo.setMbr_id(idchk);
		vo.setMbr_nm(nmchk);
		vo.setMbr_phone(phchk);
		
		dao.searchPw(vo);
		
		return null;
	}

}
