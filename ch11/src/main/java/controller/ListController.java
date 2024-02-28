package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.MemberDTO;
import service.MemberService;


@WebServlet("/member/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private MemberService service = MemberService.getInstace();
	
	//java 기본 로거
	//private Logger logger = Logger.getGlobal();
	
	//Logback 로거 생성
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
		
		//로그 출력
		logger.info("ListController - info()....");
			

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그 레벨
		logger.error("ListController error- doGet()....");
		logger.warn("ListController warn- doGet()....");
		logger.info("ListController info- doGet()....");
		logger.debug("ListController debug- doGet");
		logger.trace("ListController trace- doGet");
		
		//사용자 조회
		List<MemberDTO> users = service.selectMembers();
		
		//view에서 users데이터를 참조하기 위해 request scope에 저장
		req.setAttribute("users", users);
			
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/member/list.jsp");
		//view 출력
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
