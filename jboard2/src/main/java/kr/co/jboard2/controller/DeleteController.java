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
import kr.co.jboard2.service.FileService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	ArticleService articleService = ArticleService.getInstance();
	FileService fileService = FileService.getInstance();
	
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public void init() throws ServletException {

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String fno  = req.getParameter("fno");

		articleService.deleteArticle(no);
		
		fileService.selectFile(fno);
		
		int cnt  = //파일이 몇개가 있는지 카운팅
		
		fileService.deleteFile(no);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.do");
		dispatcher.forward(req, resp);
	}
}
