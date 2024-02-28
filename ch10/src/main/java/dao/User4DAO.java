package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User4DTO;

//Model(dao)
public class User4DAO extends DBHelper {
	
	private static User4DAO instance = new User4DAO();
	
	public static User4DAO getInstace() {
		return instance;
	}
	
	private User4DAO() {}
	
	public void insertUser4(User4DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user4` values(?,?,?,?,?,?)");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getGender());
			psmt.setString(4, user.getAge());
			psmt.setString(5, user.getHp());
			psmt.setString(6, user.getAddr());
			
			psmt.executeUpdate();
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public User4DTO selectUser4(String uid) {
		
		User4DTO user = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user4` where `uid`=?");
			
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				user = new User4DTO();
				
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setGender(rs.getString(3));
				user.setAge(rs.getString(4));
				user.setHp(rs.getString(5));
				user.setAddr(rs.getString(6));				
			}
			
			closeAll();		
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public List<User4DTO> selectUser4s() {
		List<User4DTO> users = new ArrayList<User4DTO>();
		
		User4DTO user = null;
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user4`");
			
			while(rs.next()) {
				user = new User4DTO();
				
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setGender(rs.getString(3));
				user.setAge(rs.getString(4));
				user.setHp(rs.getString(5));
				user.setAddr(rs.getString(6));
				
				users.add(user);
			}
			
			closeAll();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return users;
	}
	public void updatetUser4(User4DTO user) {
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement("update `user4` set `name`=?,`gender`=?,`age`=?,`hp`=?,`addr`=? where `uid`=?");
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getGender());
			psmt.setString(3, user.getAge());
			psmt.setString(4, user.getHp());
			psmt.setString(5, user.getAddr());
			psmt.setString(6, user.getUid());
			
			psmt.executeUpdate();
			
			closeAll();		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public void deleteUser4(String uid) {
		
		try {
			conn= getConnection();
			psmt = conn.prepareStatement("delete from `user4` where `uid`=?");
			psmt.setString(1,uid);
			
			psmt.executeUpdate();
			closeAll();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

	
	
}