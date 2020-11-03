package com.cbox.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cbox.common.Action;
import com.cbox.member.dao.MemberDAO;
import com.cbox.member.vo.MemberVO;

public class memberInfoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 1. 여기에 세션 아이디 가져와서 찍히는지 확인
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("mbr_id");
		// 2. dao.selectInfo(매개값으로 세션아이디를 String으로 넣어줌)
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo = dao.selectInfo(sid);
		session.setAttribute("myPage", vo);
		
		// 3. 그 밑에 select 문 dao에 넣기 너무양많은거 여기에 적어줌
		// 4. 여기서 처리해서 dao에 매개값으로 세션id를 보내서 받아오면 memberInfo.jsp로 이동
		// 5. select 에서 보내준 정보를 먼저 담고 리턴해줘야, 그 뒤에 수정하든말든 뭐가되는거임
		 
		 
		
		return "jsp/user/member/memberInfo.jsp";
	}

}
