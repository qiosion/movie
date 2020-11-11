package com.cbox.reservation.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.common.Paging;
import com.cbox.reservation.dao.AdminReservDAO;
import com.cbox.reservation.vo.AdminReservVO;
import com.cbox.reservation.vo.SearchVo;

public class AdminReservAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AdminReservDAO dao = new AdminReservDAO();
		List<AdminReservVO> list = new ArrayList<AdminReservVO>();
		
		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		Paging paging = new Paging();
		paging.setPage(p);
		
		AdminReservDAO cntdao = new AdminReservDAO();
		SearchVo vo = new SearchVo();
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setType(request.getParameter("searchType"));
		vo.setKeyword(request.getParameter("keyword"));
		
		paging.setTotalRecord(cntdao.count(vo));
		request.setAttribute("paging", paging);
		list = dao.AdminReservList(vo);
		request.setAttribute("allReservList", list);
		return "jsp/admin/reservation/AdminReserv.jsp";
	}

}
