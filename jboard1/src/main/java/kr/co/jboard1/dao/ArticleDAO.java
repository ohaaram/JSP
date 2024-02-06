package kr.co.jboard1.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.ArticleDTO;

public class ArticleDAO extends DBHelper{
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	public void insertArticle(ArticleDTO art){
		try {
		conn=getConnection();
		psmt= conn.prepareStatement(SQL.INSERT_ARTICLE);
		
		psmt.setString(1, art.getTitle());
		psmt.setString(2, art.getContent());
		psmt.setString(3, art.getWriter());
		psmt.setString(4, art.getRegip());
		
		psmt.executeUpdate();
		
		closeAll();	
		
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	public ArticleDTO selectArticle(int no) {
		//no를 받아서 내용물을 write에 넣어주기.
		
		return null;
	}
	
	public List<ArticleDTO> selectArticles() {
		
		List<ArticleDTO> arts= new ArrayList<>();
		ArticleDTO art=null;
		
		try {			
			conn=getConnection();
			stmt=conn.createStatement();
			
			rs = stmt.executeQuery(SQL.SELECT_ARTICLE);
			
			while(rs.next()) {
				art=new ArticleDTO();
				
				art.setNo(rs.getInt(1));
				art.setTitle(rs.getString(5));
				art.setWriter(rs.getString(9));
				art.setRdate(rs.getString(11));
				art.setHit(rs.getInt(8));
				
				arts.add(art);
				
				System.out.println(art.getNo());
			}			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return arts;
	}

	public void updateArticle(ArticleDTO article) {
	
}

	public void deleteArticle(int no) {
	
}


}
