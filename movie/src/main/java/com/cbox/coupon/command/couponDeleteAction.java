package com.cbox.coupon.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.coupon.dao.couponDAO;
import com.cbox.coupon.vo.couponVO;

public class couponDeleteAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 쿠폰삭제
		String cp_no = request.getParameter("cp_no");
		couponVO vo = new couponVO(cp_no);
		
		couponDAO dao = new couponDAO();
		dao.delete(vo);
		
		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
