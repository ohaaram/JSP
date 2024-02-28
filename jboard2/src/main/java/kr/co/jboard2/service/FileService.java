package kr.co.jboard2.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.co.jboard2.dao.FileDAO;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;

public class FileService {

	private static FileService instance = new FileService();

	public static FileService getInstance() {
		return instance;
	}

	private FileService() {
	}

	FileDAO dao = FileDAO.getInstance();

	public void insertFile(FileDTO fileDTO) {
		dao.insertFile(fileDTO);
	}

	public FileDTO selectFile(String fno) {
		return dao.selectFile(fno);
	}

	public List<FileDTO> selectFiles() {
		return dao.selectFiles();
	}

	public void updateFile(FileDTO fileDTO) {
		dao.updateFile(fileDTO);
	}

	public void deleteFile(HttpServletRequest req,String no) {
		
		//파일 이름을 리스트에 담아와서 파일을 지우면
		
		
		
		
		
		
		
		//파일 업로드 경로 설정
		ServletContext ctx =  req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");//현재 파일이 들어있는 경로확인
				
		//파일 업로드 처리 객체 생성
		//FileItemFactory factory = new DiskFileItemFactory();
		//ServletFileUpload upload = new ServletFileUpload(factory);
				
		//최대 파일 크기 설정
		//upload.setSizeMax(1024*1024*10);//10MB
				
		//ArticleDTO 생성
		ArticleDTO articleDTO = new ArticleDTO();
			
				
		//파일 DTO 리스트 생성
		List<FileDTO> fileDTOs = new ArrayList<FileDTO>();
				
		//파일 업로드 스트림 처리
				
		try {

					
			//첨부파일 갯수
			int count = articleDTO.getFile();
					
			for(FileItem item: items) {
				if(!item.isFormField()) {
				//첨부 파일일 경우
							
					if(!item.getName().isEmpty()) {				
								
							count++;
								
						String fname = item.getName();
						int idx = fname.lastIndexOf(".");
						String ext = fname.substring(idx);//파일 확장자
							
						String saveName = UUID.randomUUID().toString()+ext;
							
								
						FileDTO fileDTO = new FileDTO();
						fileDTO.setoName(fname);
				fileDTO.setsName(saveName);
									
				fileDTOs.add(fileDTO);
								
			File file = new File(uploadPath+File.separator+saveName);//파일객체 생성
			item.write(file);
		
		
		
		
		
		
		//dao.deleteFile(fno);
	}

}
