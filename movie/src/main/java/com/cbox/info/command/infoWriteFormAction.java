package com.cbox.info.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;

public class infoWriteFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글작성페이지 보기
		return "jsp/admin/info/infoWriteForm.jsp";
	}

}
