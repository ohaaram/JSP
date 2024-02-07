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

	public ArticleDTO selectArticle(int no) {
		// no를 받아서 내용물을 view에 넣어주기.
		ArticleDTO dto = null;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);

			psmt.setInt(1, no);

			rs = psmt.executeQuery();

			if (rs.next()) {

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
			psmt = conn.prepareStatement(SQL.SELECTS_ARTICLE);

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

	public void updateArticle(ArticleDTO article) {

	}

	public void deleteArticle(int no) {
	}

	public int selectCountTotal() {// 전체 게시물 수(count)를 조회

		int total = 0;

		try {

			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_COUNT_TOTAL);

			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}

	public void updateHitCount(int no) {

		try {
			conn = getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_HIT_COUNT);
			psmt.setInt(1, no);

			psmt.executeUpdate();
			
			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
