package com.cbox.coupon.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.cbox.common.Action;
import com.cbox.coupon.dao.couponDAO;
import com.cbox.coupon.vo.couponVO;

public class couponListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		couponDAO dao = new couponDAO();
		
		List<couponVO> list = dao.selectAll();
		
		try {
			response.getWriter().print(new JSONArray(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "jsp/user/coupon/couponList.jsp";
	}

}
