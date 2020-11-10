package com.cbox.reservation.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cbox.common.Action;
import com.cbox.reservation.dao.UserReservDAO;
import com.cbox.reservation.vo.UserReservVO;

public class UserReservInfoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		UserReservDAO dao = new UserReservDAO();
		List<UserReservVO> list = new ArrayList<UserReservVO>();
		UserReservVO vo = new UserReservVO();
		
		// 세션에서 mbr_no 담고
		HttpSession session = request.getSession();
		int sno = (int) session.getAttribute("mbr_no");
		// 클릭한 값에서 가져온 예매번호 tc_num 담고
		int tcno = (int) request.getAttribute("tc_no");
		System.out.println(tcno + "예매번호 제발");
		// 그것들을 vo에 담고
		vo.setMbr_no(sno);
		vo.setTc_num(tcno);
		// vo를 dao에 굴려서 list에 넣어
		list = dao.userReservOne(vo);
		request.setAttribute("userReservInfo", list);
		return null; // "jsp/user/reservation/UserReservList.jsp";
	}

}
