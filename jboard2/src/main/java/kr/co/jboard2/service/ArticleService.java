package kr.co.jboard2.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionContext;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;

public class ArticleService {
	
	private static ArticleService instance = new ArticleService();
	
	public static ArticleService getInstance() {
		return instance;
	}
	
	private ArticleService() {}
	
	private ArticleDAO articleDAO  = ArticleDAO.getInstance();
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDTO articleDTO) {
		return articleDAO.insertArticle(articleDTO);//pk값이 리턴됨
		
	}
	
	public int insertComment(ArticleDTO articleDTO) {
		return articleDAO.insertComment(articleDTO);

	}
	public ArticleDTO selectArticle(String no) {
		
		return articleDAO.selectArticle(no);
	}
	public List<ArticleDTO> selecetArticles(int start) {
		
		return articleDAO.selecetArticles(start);
	}
	
	public List<ArticleDTO> selectComments(String parent) {
		return articleDAO.selectComments(parent);
	}
	public void updateArticle(ArticleDTO articleDTO) {
		articleDAO.updateArticle(articleDTO);
	}
	public void deleteArticle(String no) {
		
		articleDAO.deleteArticle(no);
		
	}
	
	public ArticleDTO fileUpload(HttpServletRequest req) {
		// 파일 업로드 경로 설정
		ServletContext ctx = req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");
		
		// 파일 업로드 처리 객체 새성
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		// 최대 파일 크기 설정
		upload.setSizeMax(1024 * 1024 * 10); // 10MB
		
		// ArticleDTO 생성
		ArticleDTO articleDTO = new ArticleDTO(); 
		
		// 파일 DTO 리스트 생성
		List<FileDTO> fileDTOs = new ArrayList<>();
		
		// 파일 업로드 스트림 처리
		try {
			List<FileItem> items = upload.parseRequest(req);
			
			// 첨부파일 갯수
			int count = 0;
			
			for(FileItem item : items) {
				
				logger.debug("item : " + item);
				
				if(!item.isFormField()) {
					// 첨부 파일일 경우
					if(!item.getName().isEmpty()) {
						count++;
											
						String fname = item.getName();
						int idx = fname.lastIndexOf(".");
						String ext = fname.substring(idx);
						
						String saveName = UUID.randomUUID().toString() + ext;
						
						FileDTO fileDTO = new FileDTO();
						fileDTO.setoName(fname);
						fileDTO.setsName(saveName);
						fileDTOs.add(fileDTO);
						
						File file = new File(uploadPath + File.separator + saveName);
						item.write(file);
					}
				}else {
					// 폼 데이터일 경우
					String fieldName  = item.getFieldName();
					String fieldValue = item.getString("UTF-8");
					
					if(fieldName.equals("title")) {
						articleDTO.setTitle(fieldValue);
					}else if(fieldName.equals("content")) {
						articleDTO.setContent(fieldValue);
					}else if(fieldName.equals("writer")) {
						articleDTO.setWriter(fieldValue);
					}else if(fieldName.equals("no")) {
						articleDTO.setNo(fieldValue);
					}

				}
			}
			articleDTO.setFile(count);
		}catch (Exception e) {
			logger.error("fileUpload : " + e.getMessage());
		}
		
		articleDTO.setFileDTOs(fileDTOs);
		
		logger.debug("articleDTO : "+articleDTO.getNo());
		
		return articleDTO;
	}
	
	public void fileDownload(HttpServletRequest req, HttpServletResponse resp, FileDTO fileDTO) {
		
		try {
			//response 헤더 설정
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileDTO.getoName(), "utf-8"));
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache-Control", "private");
			
			//response 파일 스트림 작업
			ServletContext ctx = req.getServletContext();
			String uploadsPath = ctx.getRealPath("/uploads");

			File file = new File(uploadsPath + File.separator + fileDTO.getsName());
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
			
			while (true) {
				int data = bis.read();
				if (data == -1) {
					break;
				}
				bos.write(data);
			}
			
			bos.close();
			bis.close();
			
		
		}catch(Exception e) {
			logger.error("fileDownload : "+e.getMessage());
		}
		
	}
	
	
	public int listCount() {
		
		return articleDAO.listCount();
	}
	
	public int getLastPageNum(int total) {
		
		//마지막 페이지 번호 계산
		int lastPageNum=0;
		
		if(total%10==0){
			lastPageNum=(total/10);
		}else{
			lastPageNum=(total/10)+1;
		}	
		return lastPageNum;
	}
	
	//페이지 그룹
	public int[] getPageGroupNum(int currentPage,int lastPageNum) {
		
		//페이지번호 그룹 계산
		int pageGroupCurrent=(int)Math.ceil(currentPage/10.0);
		int pageGroupStart=(pageGroupCurrent-1)*10+1;
		int pageGroupEnd= pageGroupCurrent*10;
		
		if(pageGroupEnd>lastPageNum){
			pageGroupEnd=lastPageNum;
		}
		
		int[] result = {pageGroupStart,pageGroupEnd};
		
		return result;
	}
	
	//페이지 시작번호
	public int getPageStartNum(int total,int currentPage) {
		//페이지 시작번호 계산
		int start =(currentPage-1)*10;
		return total-start;
	}
	
	public int getCurrentPage(String pg) {
		//현재 페이지 번호
		int currentPage=1;
		
		if(pg!=null){
			currentPage=Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	//Limit 시작번호
	public int getStartNum(int currentPage) {
		return (currentPage-1)*10;
	}
	
	public int deleteComment(String no) {
		return articleDAO.deleteComment(no);
	}
	
	public void updateArticleForFileCount(int no) {
		articleDAO.updateArticleForFileCount(no);
	}
	

	
	
}
