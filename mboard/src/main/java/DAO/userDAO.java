package DAO;

import DB.DBHelper;
import DB.SQL;
import DTO.userDTO;

public class userDAO extends DBHelper{
	
	private static userDAO instance=new userDAO();//싱글톤
	public static userDAO getInstance() {
		return instance;
	}
	private userDAO(){}
	
	public userDTO selectUserForLogin(String uid, String pass) {
		//로그인한 사용자의 정보를 다 저장해놔야겠지?
		userDTO user = null;
		
		try {
			
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_USER_FOR_LOGIN);
			psmt.setString(1, uid);
			psmt.setString(2,pass);
			
			System.out.println("쿼리문 잘 들어갔나 확인 : "+psmt);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
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
			System.out.println("uid : "+rs.getString(1));
			System.out.println("pass : "+rs.getString(2));

			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}	

}
