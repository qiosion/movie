package com.cbox.reservation.command;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;
import com.cbox.reservation.dao.MovieReservationDAO;


public class ReservNoAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieReservationDAO dao = new MovieReservationDAO();
		
		String ReservNo = dao.selectReservNo();
		//System.out.println(ReservNo.substring(9));
		
		if(ReservNo.equals("")||ReservNo==null) {
			ReservNo = "0";
		}else {
			ReservNo = String.valueOf(Integer.parseInt(ReservNo.substring(9))+1) ;
			//System.out.println(ReservNo);
		}
		
		try {
			response.getWriter().print("{\"no\":"+ReservNo+"}");
		} 
		 catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

	private int parseInt(String substring) {
		// TODO Auto-generated method stub
		return 0;
	}

}
