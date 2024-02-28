package service;

import java.util.List;

import dao.User1DAO;
import dto.User1DTO;

//Model(service)->Model(dao)
public class User1Service {
	
	private static User1Service instance = new User1Service();
	public static User1Service getInstance() {
		return instance;
	}
	private User1Service() {}
	
	private User1DAO dao = User1DAO.getInstance();
	
	
	
	public void insertUser1(User1DTO user) {
		
		dao.insertUser1(user);
		
	}
	
	
	public User1DTO selectUser1(String uid) {
		
		return dao.selectUser1(uid);
	}
	
	
	public List<User1DTO> selectUser1s() {
		
		return dao.selectUser1s();
	}
	
	
	public void updatetUser1(User1DTO user) {
		
		dao.updatetUser1(user);
		
	}
	
	
	public void deleteUser1(String uid) {
		
		dao.deleteUser1(uid);
		
	}	

}
