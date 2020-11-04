package com.cbox.reservation.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.reservation.dao.MovieImageDAO;
import com.cbox.reservation.vo.MovieImageVO;


public class MovieImage implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//파라미터를 DTO에 담기
				String id = request.getParameter("id");
				MovieImageVO vo = new MovieImageVO(id); 
				//조회 처리
				MovieImageDAO dao = new MovieImageDAO();
				MovieImageVO movieimageVO = dao.select(vo);
				//조회결과를 응답
				try {
					response.getWriter().print(new JSONObject(movieimageVO));//단 건을 넘길때는 Object
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return null;
	}
	
}
