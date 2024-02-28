package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User5DTO;

//Model(dao)
public class User5DAO extends DBHelper{
	
	private static User5DAO instance = new User5DAO();
	
	public static User5DAO getInstance() {
		return instance;
	}
	
	private User5DAO() {}
	
	public void insertUser5(User5DTO user) {
		
		try {
			conn= getConnection();
			psmt = conn.prepareStatement("insert into `user5` (`name`,`gender`,`age`,`addr`)values(?,?,?,?)");
			
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getGender());
			psmt.setString(3, user.getAge());
			psmt.setString(4, user.getAddr());
			
			psmt.executeUpdate();
			closeAll();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public User5DTO selectUser5(String seq) {
		
		User5DTO user = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user5` where `seq`=?");
			
			psmt.setString(1,seq);
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				
				user = new User5DTO();
				
				user.setSeq(rs.getString(1));
				user.setName(rs.getString(2));
				user.setGender(rs.getString(3));
				user.setAge(rs.getString(4));
				user.setAddr(rs.getString(5));
			}
			
			closeAll();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	public List<User5DTO>  selectUser5s() {
		
		List<User5DTO> users = new ArrayList<User5DTO>();
		User5DTO user = null;	
		
		try {
			
			conn= getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user5`");
			
			while(rs.next()) {
				user = new User5DTO();
				
				user.setSeq(rs.getString(1));
				user.setName(rs.getString(2));
				user.setGender(rs.getString(3));
				user.setAge(rs.getString(4));
				user.setAddr(rs.getString(5));
				
				users.add(user);
				
			}
			
			closeAll();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}
	public void updateUser5(User5DTO user) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user5` set `name`=?,`gender`=?,`age`=?,`addr`=? where `seq`=?");

			psmt.setString(1, user.getName());
			psmt.setString(2, user.getGender());
			psmt.setString(3, user.getAge());
			psmt.setString(4, user.getAddr());
			psmt.setString(5, user.getSeq());
			
			psmt.executeUpdate();
			
			closeAll();		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteUser5(String seq) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user5` where `seq`=?");
			psmt.setString(1,seq);
			
			psmt.executeUpdate();
			
			closeAll();			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
}