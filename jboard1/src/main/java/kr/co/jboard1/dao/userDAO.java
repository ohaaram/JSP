package kr.co.jboard1.dao;


import java.util.List;


import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.termsDTO;
import kr.co.jboard1.dto.userDTO;
import kr.co.jboard1.dto.termsDTO;

public class userDAO extends DBHelper {
	
	// 싱글톤
	private static userDAO instance = new userDAO();
	public static userDAO getInstance() {
		return instance;
	}
	private userDAO() {}
	
	
	// 기본 CRUD 메서드
	
	public int selectCountUser(String type, String value) {
		
		StringBuilder sql = new StringBuilder(SQL.SELECT_COUNT_USER);
		
		if(type.equals("uid")) {
			
			sql.append(SQL.WHERE_UID);
			
		}else if(type.equals("nick")) {
			
			sql.append(SQL.WHERE_NICK);
			
		}else if(type.equals("email")) {
			
			sql.append(SQL.WHERE_EMAIL);
			
		}else if(type.equals("hp")) {
			
			sql.append(SQL.WHERE_HP);
			
		}
		
		int result=0;
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, value);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public void insertUser(userDTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getPass());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getNick());
			psmt.setString(5, user.getEmail());
			psmt.setString(6, user.getHp());
			psmt.setString(7, user.getRegip());
			psmt.setString(8, user.getSms());
			
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public userDTO selectUser(String uid) {
		return null;
	}
	
	public List<userDTO> selectUsers() {
		return null;
	}
	
	public void updateUser(userDTO user) {
		
	}
	
	public void deleteUser(String uid) {
		
	}
	
	// 사용자 정의 CRUD 메서드
	public userDTO selectUserForLogin(String uid, String pass) {
		
		userDTO user = null;
		
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_USER_FOR_LOGIN);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				user = new userDTO();
				user.setUid(rs.getString(1));
				user.setPass(rs.getString(2));
				user.setName(rs.getString(3));
				user.setNick(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setHp(rs.getString(6));
				user.setRole(rs.getString(7));
				user.setZip(rs.getString(8));
				user.setAddr1(rs.getString(9));
				user.setAddr2(rs.getString(10));
				user.setRegip(rs.getString(11));
				user.setRdate(rs.getString(12));
				user.setLeavedate(rs.getString(13));
			}
			
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	public termsDTO selectTerms() {
		
		termsDTO terms = null;
		
		try {
			conn = getConnection();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()){
				terms = new termsDTO();
				terms.setTerms(rs.getString(1));
				terms.setPrivacy(rs.getString(2));
				terms.setSms(rs.getString(3));
			}
			
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return terms;
	}
	
}