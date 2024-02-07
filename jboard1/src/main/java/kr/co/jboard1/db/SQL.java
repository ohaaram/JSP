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
	public static final String SELECTS_ARTICLE="SELECT a.*,b.`nick` from `article` AS a "
												+"JOIN `user` AS b ON a.writer=b.uid "
												+" ORDER BY `no` desc "
												+"LIMIT ?, 10";
	
	public static final String SELECT_ARTICLE="select * from `article` where `no`=?";
	
	public static final String SELECT_COUNT_TOTAL="SELECT COUNT(*) FROM `article`";
	
	public static final String UPDATE_HIT_COUNT="UPDATE `article` SET `hit`=`hit`+1 WHERE `no`=?";
}

