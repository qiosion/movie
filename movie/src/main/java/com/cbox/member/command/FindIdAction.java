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
		System.out.println("nmch : " + nmch);
		System.out.println("bdch : " + bdch);
		System.out.println("phch : " + phch);

		MemberVO svo = dao.searchId(vo);
		
		System.out.println("id확인: " + svo.getMbr_id());
		// 여기서 짜르고
		// id를 setattribute로 담아주고
		// 그걸 모달에서 불러
		return null;
	}

}
