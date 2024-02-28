package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User1DTO;

//Model(dao)
public class User1DAO extends DBHelper{
	
	private static User1DAO instance = new User1DAO();
	public static User1DAO getInstance() {
		return instance;
	}
	private User1DAO() {}

	
	//기본 CRUD
	public void insertUser1(User1DTO user) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user1` values(?,?,?,?,?)");
			
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getBirth());
			psmt.setString(4, user.getHp());
			psmt.setInt(5, user.getAge());
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
	}
	
	
	public User1DTO selectUser1(String uid) {
		
		User1DTO user = null;
		
		try {
			conn=getConnection();
			
			psmt = conn.prepareStatement("select * from `user1` where `uid`=?");
			
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();			
			
			if(rs.next()) {
				
				user = new User1DTO();
				
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setHp(rs.getString(4));
				user.setAge(rs.getInt(5));
				
			}
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	public List<User1DTO> selectUser1s() {
		
		List<User1DTO> users = new ArrayList<User1DTO>();
		
		try {
			conn=getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user1`");
			
			while(rs.next()) {
				
				User1DTO user = new User1DTO();
				
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setHp(rs.getString(4));
				user.setAge(rs.getInt(5));
				
				users.add(user);
			}
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	
	public void updatetUser1(User1DTO user) {
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement("update `user1` set `name`=?,`birth`=?,`hp`=?,`age`=? where `uid`=?");
			
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getBirth());
			psmt.setString(3, user.getHp());
			psmt.setInt(4, user.getAge());
			psmt.setString(5, user.getUid());
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
			
	}
	
	
	public void deleteUser1(String uid) {
		
		try {
			
			conn=getConnection();
			psmt = conn.prepareStatement("delete from `user1` where `uid` = ?");
			
			psmt.setString(1, uid);
			
			psmt.executeUpdate();
			
			closeAll();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}				
	}	
	
	
	
}