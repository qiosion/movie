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

import com.cbox.QnA.command.QnADeleteAction;
import com.cbox.QnA.command.QnADetailViewAction;
import com.cbox.QnA.command.QnAInsertAction;
import com.cbox.QnA.command.QnAListFormAction;
import com.cbox.QnA.command.QnAReplyAction;
import com.cbox.QnA.command.QnAReplyFormAction;
import com.cbox.QnA.command.QnAWriteFormAction;
import com.cbox.coupon.command.couponDeleteAction;
import com.cbox.coupon.command.couponFormAction;
import com.cbox.coupon.command.couponFormAdAction;
import com.cbox.coupon.command.couponInsertAction;
import com.cbox.coupon.command.couponListAction;
import com.cbox.coupon.command.couponSelectAction;
import com.cbox.info.command.DetailViewAction;
import com.cbox.info.command.infoDeleteAction;
import com.cbox.info.command.infoInsertAction;
import com.cbox.info.command.infoListAction;
import com.cbox.info.command.infoUpdateAction;
import com.cbox.info.command.infoUpdateFormAction;
import com.cbox.info.command.infoWriteFormAction;
import com.cbox.member.command.FindIdAction;
import com.cbox.member.command.FindPwAction;
import com.cbox.member.command.idChkAction;
import com.cbox.member.command.loginAction;
import com.cbox.member.command.loginForm;
import com.cbox.member.command.logoutAction;
import com.cbox.member.command.memDelAction;
import com.cbox.member.command.memberDeleteAction;
import com.cbox.member.command.memberFormAction;
import com.cbox.member.command.memberInfoAction;
import com.cbox.member.command.memberInsertAction;
import com.cbox.member.command.memberListAction;
import com.cbox.member.command.memberUpdateAction;
import com.cbox.movie.command.movieChartListAction;
import com.cbox.movie.command.movieDetailAction;
import com.cbox.movie.command.movieExpectListAction;
import com.cbox.movie.command.movieListAction;
import com.cbox.movie.command.movieListFormAction;
import com.cbox.movie.command.mvDeleteAction;
import com.cbox.movie.command.mvListAction;
import com.cbox.movie.command.mvRegistAction;
import com.cbox.movie.command.mvRegistFormAction;
import com.cbox.movie.command.mvUpdateAction;
import com.cbox.movie.command.mvUpdateFormAction;
import com.cbox.movie.command.scMvDetailAction;
import com.cbox.movie.command.scMvInsertAction;
import com.cbox.movie.command.scMvListAction;
import com.cbox.movie.command.scMvUpdateAction;
import com.cbox.movie.command.screenMvFormAction;
import com.cbox.reservation.command.AdminReservAction;
import com.cbox.reservation.command.MvFindImgAction;
import com.cbox.reservation.command.ReservDeleteAction;
import com.cbox.reservation.command.ReservFromTodayAction;
import com.cbox.reservation.command.ReservInsertAction;
import com.cbox.reservation.command.ReservNoAction;
import com.cbox.reservation.command.ReservSeatSearchAction;
import com.cbox.reservation.command.ReservationForm;
import com.cbox.reservation.command.UserReservInfoAction;
import com.cbox.reservation.command.UserReservListAction;
import com.cbox.reservation.command.mvFindDateAction;
import com.cbox.reservation.command.mvFindTimeAction;
import com.cbox.review.command.reviewInsertAction;

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
		// 화진
		// user
		map.put("/main.do", new MainAction()); // 처음 브라우저에 접근했을 때 사용
		map.put("/movieListForm.do", new movieListFormAction());
		map.put("/ajax/movieList.do", new movieListAction());
		map.put("/movieExpectList.do", new movieExpectListAction());
		map.put("/movieChartList.do", new movieChartListAction());
		map.put("/movieDetail.do", new movieDetailAction());

		// admin
		map.put("/mvList.do", new mvListAction());
		map.put("/mvRegistForm.do", new mvRegistFormAction());
		map.put("/ajax/mvRegist.do", new mvRegistAction());

		map.put("/mvUpdateForm.do", new mvUpdateFormAction());
		map.put("/ajax/mvUpdate.do", new mvUpdateAction());
		map.put("/ajax/mvDelete.do", new mvDeleteAction());

		// 상영 영화
		map.put("/screenMvForm.do", new screenMvFormAction());
		map.put("/ajax/screenMvList.do", new scMvListAction());	// 조회
		map.put("/ajax/screenMvDetail.do", new scMvDetailAction());	// 상세
		map.put("/ajax/screenMvInsert.do", new scMvInsertAction());	// 등록
		map.put("/ajax/screenMvUpdate.do", new scMvUpdateAction());	// 수정
//		map.put("/ajax/screenMvDelete.do", new scMvDeleteAction());	// 삭제


		// 은선
		map.put("/login.do", new loginAction()); // 로그인 결과
		map.put("/loginForm.do", new loginForm()); // 로그인 화면
		map.put("/ajax/findId.do", new FindIdAction()); // id찾기
		map.put("/ajax/findPw.do", new FindPwAction()); // 비번찾기
		map.put("/memberForm.do", new memberFormAction()); // 회원가입 화면
		map.put("/memberInsert.do", new memberInsertAction()); // user 회원등록
		map.put("/exclude/idChk.do", new idChkAction()); // 중복 id 체크
		map.put("/memberInfo.do", new memberInfoAction()); // user 회원정보
		map.put("/memberUpdate.do", new memberUpdateAction()); // user 회원정보수정
		map.put("/memberDelete.do", new memberDeleteAction()); // user 회원탈퇴
		map.put("/memberList.do", new memberListAction()); // admin 회원목록
		map.put("/memDel.do", new memDelAction()); // admin 회원탈퇴
		map.put("/logout.do", new logoutAction()); // 로그아웃
		map.put("/UserReservList.do", new UserReservListAction()); // user 예매정보 전체 보기
		map.put("/UserReservInfo.do", new UserReservInfoAction()); // user 예매정보 상세 보기
		map.put("/AdminReserv.do", new AdminReservAction()); // admin 전체 예매현황 보기
		map.put("/ReservFromToday.do", new ReservFromTodayAction()); // admin 오늘부터의 예매현황 보기
		map.put("/reviewInsert.do", new reviewInsertAction()); // user 리뷰작성
		
		
		// 광희
		map.put("/reservation/reservationForm.do", new ReservationForm()); // 예매하기 Form
		// ajax
		map.put("/ajax/mvFindDate.do", new mvFindDateAction()); // 영화 id값에 맞는 날짜 찾아오기.
		map.put("/ajax/mvFindTime.do", new mvFindTimeAction()); // 영화 id와 date에 맞는 상영시간 찾아오기.
		map.put("/ajax/mvFindImg.do", new MvFindImgAction()); //mv image 갖고오기
		map.put("/ajax/ReservInsert.do", new ReservInsertAction()); //예매내역 저장
		map.put("/ajax/ReservNo.do", new ReservNoAction()); //예매번호 생성
		map.put("/ajax/ReservSeatSearch.do", new ReservSeatSearchAction()); //예매된좌석찾기
		map.put("/ajax/ReservDelete.do", new ReservDeleteAction()); //예매취소

		// 재훈

		map.put("/infoList.do", new infoListAction()); // 게시판 전체목록 불러오기
		map.put("/DetailView.do", new DetailViewAction());// 제목 클릭시 상세페이지
		map.put("/infoInsert.do", new infoInsertAction());// db에값추가
		map.put("/infoWriteForm.do", new infoWriteFormAction());// 글작성페이지 보기
		map.put("/infoDelete.do", new infoDeleteAction());// 글삭제
		map.put("/infoUpdate.do", new infoUpdateAction());// 글수정
		map.put("/infoUpdateForm.do", new infoUpdateFormAction());// 글수정페이지로 이동
		//쿠폰
		map.put("/couponForm.do", new couponFormAction());//유저
		map.put("/couponFormAd.do", new couponFormAdAction());//관리자
		map.put("/ajax/couponList.do", new couponListAction());//쿠폰리스트
		map.put("/ajax/couponDelete.do", new couponDeleteAction());//쿠폰삭제
		map.put("/ajax/couponInsert.do", new couponInsertAction());//쿠폰등록
		map.put("/ajax/couponSelect.do", new couponSelectAction());//쿠폰조회
		//1:1문의
		map.put("/QnAListForm.do", new QnAListFormAction());
		map.put("/QnAWriteForm.do", new QnAWriteFormAction());
		map.put("/QnAInsert.do", new QnAInsertAction());
		map.put("/QnAReplyForm.do", new QnAReplyFormAction());
		map.put("/QnADetailView.do", new QnADetailViewAction());
		map.put("/QnAReply.do", new QnAReplyAction());
		map.put("/QnADelete.do", new QnADeleteAction());
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 실제 수행할 명령 정리
		request.setCharacterEncoding("utf-8"); // 한글 처리
		response.setContentType("text/html; charset=UTF-8");
		// 실제 요청하는 Path를 구하기 위한 것
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length()); // 실제 요청 들어오는 요청 페이지

		// 인터페이스 Action으로 command라는걸 생성
		Action command = map.get(path); // path : /main.do 같은거 -> MainAction()을 찾아온다.
		String viewPage = command.exec(request, response); // 명령어가 수행되는 부분. 명령이 수행되고 나서 보여줄 페이지 선택(String 타입으로 반환)

		// 내가 요청(request)하는 객체 그대로 전달
		// viewPage : 내 요청 객체를 전달해줄 페이지
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); // 선택된 페이지로 가기
			dispatcher.forward(request, response); // 페이지 return 시켜줌(forward)
		}
	}
}
