package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import db.DBHelper;
import dto.MemberDTO;

public class MemberDAO extends DBHelper{
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	//로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertMember(MemberDTO member) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `member` values(?,?,?,?,?,subString(now(),1,10))");
			
			psmt.setString(1, member.getUid());
			psmt.setString(2, member.getName());
			psmt.setString(3, member.getHp());
			psmt.setString(4, member.getPos());
			psmt.setString(5, member.getDep());
			
			logger.info("insert - psmt : "+psmt);
			
			psmt.executeUpdate();
			
			closeAll();	
			
			
		}catch(Exception e) {
			logger.error("insertMember() : "+e.getMessage());
		}
	}
	public MemberDTO selectMember(String uid) {
		
		MemberDTO member = null;
		try {
			conn= getConnection();
			psmt = conn.prepareStatement("select * from `member` where `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				member = new MemberDTO();
				
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getString(5));
				member.setRdate(rs.getString(6));
			}
			
			closeAll();
			
			
		}catch(Exception e) {
			logger.error("selectMember() - psmt : "+e.getMessage());
		}
		
		return member;
	}
	public List<MemberDTO> selectMembers() {
		
		
		MemberDTO member = null;
		List<MemberDTO> members = new ArrayList<MemberDTO>();
		
		try {
			
			conn =getConnection();
			psmt = conn.prepareStatement("select * from `member`");
			
			logger.info("psmt : "+psmt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberDTO();
				
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getString(5));
				member.setRdate(rs.getString(6));
				
				members.add(member);
			}
			closeAll();
			
		}catch(Exception e) {
			//로그 출력
			logger.error("selectMembers() : "+e.getMessage());
		}
		return members;
		
	}
	public void updateMember(MemberDTO member) {
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement("update `member` set `name`=?,`hp`=?,`pos`=?,`dep`=?, `rdate`=? where `uid`=?");

			psmt.setString(1, member.getName());
			psmt.setString(2, member.getHp());
			psmt.setString(3, member.getPos());
			psmt.setString(4, member.getDep());
			psmt.setString(5, member.getRdate());
			psmt.setString(6, member.getUid());
			
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			logger.error("updateMember() : "+e.getMessage());
		}
	}
	public void deleteMember(String uid) {
		
		try {
			conn=getConnection();
			
			psmt = conn.prepareStatement("delete from `member` where `uid`=?");
			psmt.setString(1, uid);
			
			psmt.executeUpdate();
			
			closeAll();
		}catch(Exception e) {
			logger.error("deleteMember : "+e.getMessage());
		}
	}

}
