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

	public int deleteFile(String fno) {
		
		return dao.deleteFile(fno);
	}

}
