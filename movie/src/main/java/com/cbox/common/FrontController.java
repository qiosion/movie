package com.cbox.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.reservation.command.ReservationForm;

@MultipartConfig
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Action> map = new HashMap<String, Action>();

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		// 요청 정의. (요청페이지명, 명령)
		//화진
		map.put("/main.do", new MainAction()); // 처음 브라우저에 접근했을 때 사용
		map.put("/movieList.do", new movieListAction());
		
		
		
		
		
		
		
		
		
		
		
		
		// 은선
		map.put("/memberForm.do", new memberFormAction());
		map.put("/loginForm.do", new loginFormAction());
		map.put("/memberList.do", new MemberListAction());
		
		
		
		
		
		
		
		
		// 광희
		map.put("/reservationForm.do", new ReservationForm()); //예매하기 Form
		
		
		
		
		
		
		
		
		
		// 재훈
		
//		map.put("/memberForm.do", new memberFormAction());
//		map.put("/memberForm.do", new memberFormAction());
//		map.put("/memberForm.do", new memberFormAction());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 실제 수행할 명령 정리
		request.setCharacterEncoding("utf-8"); // 한글 처리
		// 실제 요청하는 Path를 구하기 위한 것
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length()); // 실제 요청 들어오는 요청 페이지

		// 인터페이스 Action으로 command라는걸 생성
		Action command = map.get(path); // path : /main.do 같은거 -> MainAction()을 찾아온다.
		String viewPage = command.exec(request, response); // 명령어가 수행되는 부분. 명령이 수행되고 나서 보여줄 페이지 선택(String 타입으로 반환)

		// 내가 요청(request)하는 객체 그대로 전달
		// viewPage : 내 요청 객체를 전달해줄 페이지
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); // 선택된 페이지로 가기
		dispatcher.forward(request, response); // 페이지 return 시켜줌(forward)
	}
}
