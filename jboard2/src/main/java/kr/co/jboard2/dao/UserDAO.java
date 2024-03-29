package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.UserDTO;

public class UserDAO extends DBHelper {

	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO userDTO) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, userDTO.getUid());
			psmt.setString(2, userDTO.getPass());
			psmt.setString(3, userDTO.getName());
			psmt.setString(4, userDTO.getNick());
			psmt.setString(5, userDTO.getEmail());
			psmt.setString(6, userDTO.getHp());
			psmt.setString(7, userDTO.getRegip());
			psmt.setString(8, userDTO.getSms());
			logger.info("insertUser : " + psmt);
			
			psmt.executeUpdate();
			
			closeAll();
		}catch (Exception e) {
			logger.error("insertUser : " + e.getMessage());
		}
		
	}
	public UserDTO selectUser(String uid) {
		
		return null;
	}
	public List<UserDTO> selectUsers() {
		return null;
	}
	public void updateUser(UserDTO userDTO) {
		
	}
	public void deleteUser(String uid) {
		
	}	
	
	public int selectCountUser(String type,String value) {
		
		StringBuilder sql =new StringBuilder(SQL.SELECT_COUNT_USER);
		
		if(type.equals("uid")) {

			sql.append(SQL.WHERE_UID);
			
		}else if(type.equals("nick")) {
			
			sql.append(SQL.WHERE_NICK);
			
		}else if(type.equals("hp")) {
			
			sql.append(SQL.WHERE_HP);
		}else if(type.equals("email")) {
			sql.append(SQL.WHERE_EMAIL);
		}
		
		int result = 0;
		
		try {
			
			conn=getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, value);
			
			logger.info("selectCountUser : "+psmt);
			
			rs=psmt.executeQuery();
			
			
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			closeAll();
			
			
		}catch(Exception e) {
			logger.error("selectCountUser : "+e.getMessage());
		}
		return result;
		
	}
	
	public UserDTO selectUserForLogin(String uid,String pass) {
		//로그인을 위해서 만듬		

		UserDTO user = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER_FOR_LOGIN);
			
			psmt.setString(1,uid);
			psmt.setString(2,pass);
			
			logger.info("selectUserForLogin 여기서 에러라는 것인가? : "+psmt);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				user = new UserDTO(); 
				
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
				user.setSms(rs.getString(12));
				user.setRdate(rs.getString(13));
				user.setLeaveDate(rs.getString(14));
			}
			
			closeAll();
			
		}catch(Exception e) {
			
			logger.error("selectUser : "+e.getMessage());
		}	
		
		return user;
		
	}
}