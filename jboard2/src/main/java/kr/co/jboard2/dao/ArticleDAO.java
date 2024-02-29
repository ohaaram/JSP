package kr.co.jboard2.dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;
import kr.co.jboard2.dto.UserDTO;

public class ArticleDAO extends DBHelper{
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDTO articleDTO) {	///유용한 테그닉이다!!! 잘 보기!!!!	pk값을 가져오는부분!!!
		
		int pk=0;
		
		try {
			
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE, Statement.RETURN_GENERATED_KEYS);
			//insert가 실행되고 자동 생성되는 pk값을 리턴하는 옵션

			psmt.setString(1, articleDTO.getTitle());
			psmt.setString(2, articleDTO.getContent());
			psmt.setInt(3, articleDTO.getFile());
			psmt.setString(4, articleDTO.getWriter());
			psmt.setString(5, articleDTO.getRegip());
			
			logger.info("insertArticle : "+ psmt);
			
			//insert 실행(행이 생성됨)
			psmt.executeUpdate();
			
			//생성된 pk 가져오기(행이 성생이되면 pk값이 생성되는것임)			
			rs = psmt.getGeneratedKeys();
			
			if(rs.next()) {
				pk = rs.getInt(1);
			}
			
			closeAll();			
			
		}catch(Exception e) {
			logger.error("insertArticle : "+e.getMessage());
		}
		return pk;
		
	}
	
	public int insertComment(ArticleDTO articleDTO) {
		
		int result = 0;
		int pk=0;
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_COMMENT, Statement.RETURN_GENERATED_KEYS);
			psmt.setInt(1, articleDTO.getParent());
			psmt.setString(2, articleDTO.getContent());
			psmt.setString(3, articleDTO.getWriter());
			psmt.setString(4, articleDTO.getRegip());
			
			logger.info("insertComment : "+psmt);
						
			 result = psmt.executeUpdate();//결과값 : 성공한 row의 count 수 
			 
			 
			//INSERT 해서 부여된 AUTO_INCREMENT PK 값 가져오기			
			rs = psmt.getGeneratedKeys();
				
			if(rs.next()) {
				pk = rs.getInt(1);
			}
			
			closeAll();
			
			
		}catch(Exception e) {
			logger.error("insertComment : "+e.getMessage());
		}
		
		return pk;
		
	}
	public ArticleDTO selectArticle(String no) {
		
		ArticleDTO articleDTO=null;
		List<FileDTO> files = new ArrayList<FileDTO>();
		
		try {
			conn=getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			psmt.setString(1, no);
			
			logger.info("selectArticle : "+psmt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				//글 하나당 파일이 여러개일 경우 글객체(articleDTO)는 여러개 생성할 필요가 없기 때문에 1개만 생성되도록 조건처리
				if(articleDTO == null) {
				
					articleDTO = new ArticleDTO();
					
					articleDTO.setNo(rs.getInt(1));
					articleDTO.setParent(rs.getInt(2));
					articleDTO.setComment(rs.getInt(3));
					articleDTO.setCate(rs.getString(4));
					articleDTO.setTitle(rs.getString(5));
					articleDTO.setContent(rs.getString(6));
					articleDTO.setFile(rs.getInt(7));
					articleDTO.setHit(rs.getInt(8));
					articleDTO.setWriter(rs.getString(9));
					articleDTO.setRegip(rs.getString(10));
					articleDTO.setRdate(rs.getString(11));
					
				}
				FileDTO fileDTO = new FileDTO();
				
				fileDTO.setFno(rs.getInt(12));
				fileDTO.setAno(rs.getInt(13));
				fileDTO.setoName(rs.getString(14));
				fileDTO.setsName(rs.getString(15));
				fileDTO.setDownload(rs.getInt(16));
				fileDTO.setRdate(rs.getString(17));
				
				files.add(fileDTO);
			}
			
			articleDTO.setFileDTOs(files);
			
			closeAll();
			
		}catch(Exception e) {
			logger.error("selectArticle : "+e.getMessage());
		}
		
		return articleDTO;
	}
	public List<ArticleDTO> selecetArticles(int start) {
		
		List<ArticleDTO> lists = new ArrayList<ArticleDTO>();
		ArticleDTO list = null;
		
		try {
			conn=getConnection();
			//stmt = conn.createStatement();
			
			StringBuilder sql = new StringBuilder(SQL.SELECTS_ARTICLE);
			
			sql.append(SQL.SELECTS_ARTICLE_OERDER_LIMIT);	
			
			psmt = conn.prepareStatement(sql.toString());
			
			psmt.setInt(1, start);						
					
			rs = psmt.executeQuery();
			//rs = stmt.executeQuery(sql.toString());
			
			while(rs.next()) {
				list = new ArticleDTO();
				
				list.setNo(rs.getInt(1));
				list.setParent(rs.getInt(2));
				list.setComment(rs.getInt(3));
				list.setCate(rs.getString(4));
				list.setTitle(rs.getString(5));
				list.setContent(rs.getString(6));
				list.setFile(rs.getInt(7));
				list.setHit(rs.getInt(8));
				list.setWriter(rs.getString(9));
				list.setRegip(rs.getString(10));
				list.setRdate(rs.getString(11));
				list.setNick(rs.getString(12));
				
				lists.add(list);
			}
			
			closeAll();		
			
		}catch(Exception e) {
			logger.error("selecetArticles : "+e.getMessage());
		}
		
		return lists;
	}
	
	public List<ArticleDTO> selectComments(String parent) {
		
		ArticleDTO article = null;
		List<ArticleDTO> comments = new ArrayList<ArticleDTO>();
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setString(1,parent);
			logger.info("selectComments : "+psmt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				article = new ArticleDTO();
				
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setWriter(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				comments.add(article);
				
			}	
			
			closeAll();
			
		}catch(Exception e) {
			logger.error("selectComments : "+e.getMessage());
		}
		
		return comments;
	}
	public void updateArticle(ArticleDTO articleDTO) {
		
		try {
			
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_COMMENT);
			psmt.setString(1, articleDTO.getContent());
			psmt.setInt(2, articleDTO.getNo());
			
			logger.info("updateArticle : "+psmt);
			
			System.out.println("updateArticle : " +psmt);
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			
			logger.error("updateArticle : "+ e.getMessage());
		}			
	}
	public void deleteArticle(String no) {
		
		try {
			conn=getConnection();
			conn.setAutoCommit(false);
			
			psmtEtc1 = conn.prepareStatement(SQL.DELETE_FILE);
			psmtEtc1.setString(1, no);
			psmtEtc1.executeUpdate();
			
			psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
			psmt.setString(1, no);
			psmt.executeUpdate();	
			
			conn.commit();			
			
			closeAll();		
			
		}catch(Exception e) {
			
			logger.error("deleteArticle : "+e.getMessage());
		}		
	}
	
	public int listCount() {
		
		int total=0;
		
		try {
			conn=getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_COUNT_TOTAL);
			
			if (rs.next()) {
				total = rs.getInt(1);
			}
			
			closeAll();				
			
		}catch(Exception e) {
			logger.error("listCount : " +e.getMessage());
		}
		
		return total;
	}	
	
	public void updateArticleForFileCount(int no) {
		try {
			
			conn=getConnection();
			
			conn.prepareStatement(SQL.UPDATE_ARTICLE_FOR_FILE_COUNT);
			psmt.setInt(1,no);
			
			logger.info("updateArticleForFileCount : " + psmt);
			
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			logger.error("updateArticleForFileCount : "+e.getMessage());
		}
	}
	
	public int deleteComment(String no) {
		
		int result =0;
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
			psmt.setString(1, no);
			logger.info("deleteComment : "+psmt);
			
			result = psmt.executeUpdate();
			
			closeAll();
			
			
		}catch(Exception e) {
			logger.error("deleteComment : "+e.getMessage());
		}
		return result;
	}

}
