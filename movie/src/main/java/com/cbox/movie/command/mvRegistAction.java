package com.cbox.movie.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;

public class mvRegistAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 여기서 등록 dao로 영화제목이나 번호 가져와서 중복 없나 체크
		// 값을 vo에 저장해서 결과.jsp로 넘김
		// 여기서 올바르게 저장됐으면 목록으로 실패했으면 팝업창이 뜨도록하기..흠
		return null;
	}

}
