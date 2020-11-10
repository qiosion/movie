package com.cbox.coupon.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.coupon.dao.couponDAO;
import com.cbox.coupon.vo.couponVO;

public class couponFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		couponDAO dao = new couponDAO();
		
		List<couponVO> list = new ArrayList<couponVO>();
		
		list = dao.selectAll();
		request.setAttribute("cpList", list);
		return "jsp/user/coupon/couponList.jsp";
	}

}
