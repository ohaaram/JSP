package kr.co.jboard1.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {

	private static ArticleDAO instance = new ArticleDAO();

	public static ArticleDAO getInstance() {
		return instance;
	}

	private ArticleDAO() {
	}

	
	public void insertArticle(ArticleDTO art) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);

			psmt.setString(1, art.getTitle());
			psmt.setString(2, art.getContent());
			psmt.setString(3, art.getWriter());
			psmt.setString(4, art.getRegip());

			psmt.executeUpdate();

			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArticleDTO selectArticle(String no) {
		// no를 받아서 내용물을 view에 넣어주기.
		ArticleDTO dto = null;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);

			psmt.setString(1, no);

			rs = psmt.executeQuery();

			if (rs.next()) {

				dto = new ArticleDTO();

				dto.setNo(rs.getString(1));
				dto.setParent(rs.getInt(2));
				dto.setComment(rs.getInt(3));
				dto.setCate(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getInt(7));
				dto.setHit(rs.getInt(8));
				dto.setWriter(rs.getString(9));
				dto.setRegip(rs.getString(10));
				dto.setRdate(rs.getString(11));

			}

			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	public List<ArticleDTO> selectArticles(int start) {

		List<ArticleDTO> arts = new ArrayList<>();
		ArticleDTO art = null;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECTS_ARTICLE+SQL.SELECTS_ARTICLE_OERDER_LIMIT);

			psmt.setInt(1, start);

			rs = psmt.executeQuery();
			while (rs.next()) {
				art = new ArticleDTO();

				art.setNo(rs.getInt(1));
				art.setTitle(rs.getString(5));
				art.setWriter(rs.getString(9));
				art.setRdate(rs.getString(11));
				art.setHit(rs.getInt(8));
				art.setNick(rs.getString(12));

				arts.add(art);
			}

			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return arts;
	}
	
	public List<ArticleDTO> selectAriclesForSearch(String searchType, String keyword,int start) {
		
		List<ArticleDTO> arts = new ArrayList<>();		
		ArticleDTO dto = null;
		
		//동적 문자열 생성
		StringBuilder sql = new StringBuilder(SQL.SELECTS_ARTICLE);
		
		if(searchType.equals("title")) {
			sql.append(SQL.SELECTS_ARTICLE_WHERE_TITLE);
			
		}else if(searchType.equals("content")){
			sql.append(SQL.SELECTS_ARTICLE_WHERE_CONTENT);
			
		}else if(searchType.equals("title_content")){
			sql.append(SQL.SELECTS_ARTICLE_WHERE_TITLE_CONTENT);
		}else if(searchType.equals("writer")){
			sql.append(SQL.SELECTS_ARTICLE_WHERE_WRITER);
		}
		
		sql.append(SQL.SELECTS_ARTICLE_OERDER_LIMIT);
		
		try {
			
			conn=getConnection();
			psmt = conn.prepareStatement(sql.toString());//StringBuilder때문에 이렇게 바꿈.
			
			//동적 쿼리 생성
			if(searchType.equals("title_content")) {
				
				psmt.setString(1, "%"+keyword+"%");
				psmt.setString(2, "%"+keyword+"%");	
				psmt.setInt(3, start);
				
			}else {
				psmt.setString(1, "%"+keyword+"%");
				psmt.setInt(2,start);
			}

			System.out.println(psmt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new ArticleDTO();
				
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setComment(rs.getInt(3));
				dto.setCate(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getInt(7));
				dto.setHit(rs.getInt(8));
				dto.setWriter(rs.getString(9));
				dto.setRegip(rs.getString(10));
				dto.setRdate(rs.getString(11));
				dto.setNick(rs.getString(12));
		
				arts.add(dto);				
			}
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return arts;
	}

	public void updateArticle(ArticleDTO article) {
		
		try {
			
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setInt(3, article.getNo());
			
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteArticle(int no) {
	}

	public int selectCountTotal(String searchType,String keyword) {// 전체 게시물 수(count)를 조회 - StringBuilder확인해 보기

		int total = 0;
		
		StringBuilder sql = new StringBuilder(SQL.SELECT_COUNT_TOTAL);
		StringBuilder sql2 = new StringBuilder(SQL.COUNT_SELECTS_ARTICLE_WHERE_WRITER);

		
		if(searchType!=null && keyword!=null) {
		
			if(searchType.equals("title")) {
				sql.append(SQL.SELECTS_ARTICLE_WHERE_TITLE);
				
			}else if(searchType.equals("content")){
				sql.append(SQL.SELECTS_ARTICLE_WHERE_CONTENT);
				
			}else if(searchType.equals("title_content")){
				sql.append(SQL.SELECTS_ARTICLE_WHERE_TITLE_CONTENT);
			}else if(searchType.equals("writer")) {

				sql2.append(SQL.SELECTS_ARTICLE);
				sql2.append(SQL.SELECTS_ARTICLE_WHERE_WRITER);
				sql2.append(") AS subquery");
				
			    System.out.println(sql2.toString());
			    
			    sql = sql2;
			}
		}

		try {

			conn = getConnection();
			
			psmt = conn.prepareStatement(sql.toString());
			
			if(searchType!=null && keyword!=null) {
			
				if(searchType.equals("title_content")) {
					
					psmt.setString(1, "%"+keyword+"%");
					psmt.setString(2, "%"+keyword+"%");	
					
				}else{
					psmt.setString(1, "%"+keyword+"%");
				}
				System.out.println(psmt);
			}
			
			rs = psmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}

	public void updateHitCount(String no) {

		try {
			conn = getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_HIT_COUNT);
			psmt.setString(1, no);

			psmt.executeUpdate();
			
			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertComment(ArticleDTO comment) {
		
		try {
			
			conn=getConnection();
			conn.setAutoCommit(false);//트랜젝션 자동으로 커밋하는거 끄기
			
			psmt=conn.prepareStatement(SQL.INSERT_COMMENT);
					
			
			psmt.setInt(1, comment.getParent());
			psmt.setString(2, comment.getContent());
			psmt.setString(3, comment.getWriter());
			psmt.setString(4, comment.getRegip());
			System.out.println(psmt);
			
			psmtEtc1=conn.prepareStatement(SQL.UPDATE_ARTICLE_COMMENT_PLUS);	
			psmtEtc1.setInt(1, comment.getParent());
			
			System.out.println(psmtEtc1);
			
			psmt.executeUpdate();
			psmtEtc1.executeUpdate();
			
			conn.commit();//트랜젝션 종료			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<ArticleDTO> selectCommnets(String parent) {
		
		List<ArticleDTO> comments = new ArrayList<ArticleDTO>();
		
		try {
			
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setString(1, parent);

			
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				ArticleDTO comment = new ArticleDTO();
				
				comment.setNo(rs.getString(1));
				comment.setParent(rs.getInt(2));
				comment.setContent(rs.getString(6));
				comment.setWriter(rs.getString(9));
				comment.setRegip(rs.getString("regip"));//컬럼순서대신에 이름을 적어도 가능함
				comment.setRdate(rs.getString("rdate"));
				comment.setNick(rs.getString("nick"));
				
				System.out.println(comment.getContent());

				comments.add(comment);
			}
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return comments;
	}

	public void deleteComment(String no,String parent) {
		try {
			conn=getConnection();
			conn.setAutoCommit(false);
			
			psmt =  conn.prepareStatement(SQL.DELETE_COMMENT);
			psmt.setString(1, no);
			System.out.println(psmt);
			psmt.executeUpdate();
			
			psmtEtc1 = conn.prepareStatement(SQL.UPDATE_ARTICLE_COMMENT_MINUS);
			psmtEtc1.setString(1,parent);			
			
			psmtEtc1.executeUpdate();
			
			conn.commit();
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteArticle(String no) {
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, no);
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateComment(ArticleDTO comment) {
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.UPDATE_COMMENT);
			
			psmt.setString(1, comment.getContent());
			psmt.setInt(2, comment.getNo());
			
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
