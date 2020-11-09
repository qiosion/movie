package com.cbox.coupon.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.coupon.dao.couponDAO;
import com.cbox.coupon.vo.couponVO;

public class couponDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 쿠폰삭제
		couponDAO dao = new couponDAO();
		couponVO vo = new couponVO();
		
		vo.setCp_no(Integer.valueOf(request.getParameter("cp_no")));
		
		dao.delete(vo);
		
		 try {
				response.sendRedirect(request.getContextPath()+"/couponList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		return null;
	}

}
