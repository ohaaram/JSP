package kr.co.jboard2.controller;

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

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.service.ArticleService;

@WebServlet("/list.do")
public class ListControllder extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private ArticleService service = ArticleService.getInstance();
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이지번호
		
		//데이터 수신
		String pg = req.getParameter("pg");
		
		//현재 페이지 번호 
		int currentPage = service.getCurrentPage(pg);
		
		//전체 게시물 갯수
		int total = service.listCount();//전체 글 갯수
		
		//마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		//페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		//페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		//시작 인덱스
		int start = service.getStartNum(currentPage);
		
			
		//리스트 조회
		List<ArticleDTO> article = service.selecetArticles(start);

		//list.jsp에서 article 데이터를 참조하기 위해 request scope에 저장
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("article", article);			
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

}
