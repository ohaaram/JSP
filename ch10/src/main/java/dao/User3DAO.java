package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User3DTO;

//Model(dao)
public class User3DAO extends DBHelper{
	
	private static User3DAO instance = new User3DAO();
	public static User3DAO getInstance() {
		return instance;
	}
	private User3DAO() {}
	
	public void insertUser3(User3DTO user) {
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user3` values(?,?,?,?,?)");
		
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getBirth());
			psmt.setString(4, user.getHp());
			psmt.setString(5, user.getAddr());
			
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	
	public User3DTO selectUser3(String uid) {
		
		User3DTO user =null;
		try {
			conn=getConnection();
			psmt = conn.prepareStatement("select * from `user3` where `uid`=?");
			
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				user = new User3DTO();
				
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setHp(rs.getString(4));
				user.setAddr(rs.getString(5));
			}
			
			closeAll();		

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public List<User3DTO> selectUser3s() {
		List<User3DTO> users = new ArrayList<User3DTO>();
		
		User3DTO user = null;
		
		try {
			conn=getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user3`");
			
			while(rs.next()) {
				user = new User3DTO();
				
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setHp(rs.getString(4));
				user.setAddr(rs.getString(5));
				
				users.add(user);				
			}
			
			closeAll();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return users;
	}
	
	public void updateUser3(User3DTO user) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user3` set `name`=?,`birth`=?,`hp`=?,`addr`=? where `uid`=?");

			psmt.setString(1, user.getName());
			psmt.setString(2, user.getBirth());
			psmt.setString(3, user.getHp());
			psmt.setString(4, user.getAddr());
			psmt.setString(5, user.getUid());
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteUser3(String uid) {
		try {
			conn=getConnection();
			psmt = conn.prepareStatement("delete from `user3` where `uid`=?");
			
			psmt.setString(1, uid);
			
			psmt.executeUpdate();

			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

	
}