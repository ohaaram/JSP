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

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = -1583953554011146813L;
	
	private ArticleService articleservice = ArticleService.getInstance();
	private FileService fileService = FileService.getInstance();
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		String regip = req.getRemoteAddr();

		//파일 업로드
		ArticleDTO articleDTO = articleservice.fileUpload(req);	
		articleDTO.setRegip(regip);
		
		logger.debug(""+articleDTO);		
				
		//글 등록
		int pk = articleservice.insertArticle(articleDTO);
		
		
		//파일등록
		List<FileDTO> files = articleDTO.getFileDTOs();		
		
		for(FileDTO fileDTO : files) {
			
			fileDTO.setAno(pk);
			fileService.insertFile(fileDTO);
		}
		
		resp.sendRedirect("/jboard2/list.do");
		
	}
}