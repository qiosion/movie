package com.cbox.coupon.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.coupon.dao.couponDAO;
import com.cbox.coupon.vo.couponVO;

public class couponInsertAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cp_no = request.getParameter("cp_no");
		String cp_nm = request.getParameter("cp_nm");
		Date cp_vaild_date = (Date.valueOf(request.getParameter("cp_vaild_date")));
		String cp_type = request.getParameter("cp_type");
		Integer cp_discount = (Integer.valueOf(request.getParameter("cp_discount")));
		
		couponVO vo = new couponVO();
		vo.setCp_no(cp_no);
		vo.setCp_nm(cp_nm);
		vo.setCp_vaild_date(cp_vaild_date);
		vo.setCp_type(cp_type);
		vo.setCp_discount(cp_discount);
		
		couponDAO dao = new couponDAO();
		dao.insert(vo);
		
		
		
		try {
			response.getWriter().print(new JSONObject(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
