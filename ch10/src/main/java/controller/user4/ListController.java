package controller.user4;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dto.User4DTO;
import service.User4Service;

@WebServlet("/user4/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private User4Service service = User4Service.getInstance();
	
	@Override
	public void init() throws ServletException {
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//사용자 조회하기
		List<User4DTO> users = service.selectUser4s();
		
		//view에서 users 데이터를 참조하기 위해 request scope에 저장
		req.setAttribute("users", users);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user4/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
