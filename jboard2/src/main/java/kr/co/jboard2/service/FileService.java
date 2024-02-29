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

	public int deleteFile(HttpServletRequest req, String fno) {
		
		
		FileDTO fileDTO = dao.deleteFile(fno);
		
		//업로드 디렉토리 파일 삭제
		ServletContext ctx = req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");
		
		//파일 객체 생성
		File file = new File(uploadPath+File.separator+fileDTO.getsName());
		
		//파일 삭제
		if(file.exists()) {
			file.delete();
		}
		
		return fileDTO.getAno();
	}
	
	public void deleteFilesName(String no) {		
		
		List<FileDTO> lists = new ArrayList<FileDTO>();
		
		lists= dao.deleteFilesName(no);
	}

}
