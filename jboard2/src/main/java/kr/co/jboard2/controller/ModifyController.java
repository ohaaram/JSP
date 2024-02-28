package kr.co.jboard2.controller;

import java.io.IOException;

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

@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	ArticleService articleService = ArticleService.getInstance();
	Logger logger = LoggerFactory.getLogger(this.getClass());
	

	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		//글 수정 내용들 조회
		ArticleDTO articleDTO = articleService.selectArticle(no);
		
		req.setAttribute("articleDTO", articleDTO);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		
		String no = req.getParameter("no");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		ArticleDTO dto = new ArticleDTO();
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setNo(no);
		
		articleService.updateArticle(dto);
		
		resp.sendRedirect("/jboard2/view.do?no="+dto.getNo());
	}
	
}