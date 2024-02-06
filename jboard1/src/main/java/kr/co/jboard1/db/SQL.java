package kr.co.jboard1.db;

public class SQL {
	
	
	public static final String SELECT_TERMS="select * from `terms`";
	public static final String INSERT_USER="insert into `user`(uid,pass,name,nick,email,hp,regip,rdate) values(?,SHA2(?,256),?,?,?,?,?,now())";
	
	public static final String SELECT_USER_FOR_LOGIN="select * from `user` where `uid`=? and `pass`=SHA2(?,256)";
	
	public static final String INSERT_ARTICLE="insert into `article` set "
											+"`title`=?,"
											+"`content`=?,"
											+"`writer`=?,"
											+"`regip`=?,"
											+"`rdate`=now()";
	public static final String SELECT_ARTICLE="select * from `article`";
}

