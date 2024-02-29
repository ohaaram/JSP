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

import kr.co.jboard2.service.ArticleService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private ArticleService articleService = ArticleService.getInstance();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		articleService.deleteArticle(no);
		
		
		//no를 받아와서 sname을 검색하고 no에 해당하는 파일이름들을 리스트에 저장후에 하나씩 삭제
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.do");
		dispatcher.forward(req, resp);		
		
	}

}
