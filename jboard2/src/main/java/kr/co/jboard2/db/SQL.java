package kr.co.jboard2.db;

public class SQL {
	
	
	public static final String SELECT_TERMS="select * from `terms`";
	
	public static final String SELECT_COUNT_USER="SELECT COUNT(*) FROM `user` ";
	public static final String WHERE_UID="WHERE `uid`=?";
	public static final String WHERE_NICK="WHERE `nick`=?";
	public static final String WHERE_HP="WHERE `hp`=?";
	public static final String WHERE_EMAIL="WHERE `email`=?";
	
	public static final String INSERT_USER="insert into `user`(uid,pass,name,nick,email,hp,regip,sms,rdate) values(?,SHA2(?,256),?,?,?,?,?,?,now())";
	
	public static final String SELECT_USER_FOR_LOGIN="select * from `user` where `uid`=? and `pass`= SHA2(?,256)";
	
	public static final String INSERT_ARTICLE="insert into `article` set "
											+"`title`=?,"
											+"`content`=?,"
											+"`file`=?,"
											+"`writer`=?,"
											+"`regip`=?,"
											+"`rdate`=now()";
	
	public static final String SELECTS_ARTICLE="SELECT a.*,b.`nick` from `article` AS a "
												+"JOIN `user` AS b ON a.writer=b.uid "
												+"WHERE `parent`=0 ";
	
	
	public static final String SELECTS_ARTICLE_WHERE_TITLE="and `title` like ? ";																							
	public static final String SELECTS_ARTICLE_WHERE_CONTENT="and `content` like ? ";																							
	public static final String SELECTS_ARTICLE_WHERE_TITLE_CONTENT="and (`title` like? or `content` like ?) ";																							
	public static final String SELECTS_ARTICLE_WHERE_WRITER="and `nick` like ? ";	
	
	public static final String COUNT_SELECTS_ARTICLE_WHERE_WRITER="SELECT COUNT(*) FROM (";
	
	public static final String SELECTS_ARTICLE_OERDER_LIMIT= " ORDER BY `no` desc "
															+"LIMIT ?, 10";
	
	public static final String SELECT_ARTICLE="select * from `article` as a "
												+ "left join `file` as b on a.no=b.ano "
												+ "where `no`=?";
	
	
	public static final String SELECT_COUNT_TOTAL="SELECT COUNT(*) FROM `article` WHERE `parent`=0 ";
	
	public static final String UPDATE_HIT_COUNT="UPDATE `article` SET `hit`=`hit`+1 WHERE `no`=?";
	
	public static final String INSERT_COMMENT="insert into `article` set "
												+"`parent`=?, "
												+"`content`=?, "
												+"`writer`=?, "
												+"`regip`=?, "
												+"`rdate`=now()";
	
	public static final String INSERT_FILE="insert into `file` set "
											+"`ano`=?,"
											+"`oName`=?,"
											+"`sName`=?,"
											+"`rdate`=now()";
	
	public static final String SELECT_COMMENTS="select a.*,b.nick from `article` as a join `user` as b on a.writer=b.uid where `parent`=? order by `no` asc";
	
	public static final String SELECT_FILE="select * from `file` where `fno`=?";
	
	public static final String UPDATE_ARTICLE_COMMENT_PLUS="update `article` set `comment` =`comment` + 1 where `no`=?";
	
	public static final String UPDATE_ARTICLE_COMMENT_MINUS="update `article` set `comment` =`comment` - 1 where `no`=?";
	
	
	public static final String UPDATE_FILE_DOWNLOAD="update `file` set `download`=`download`+1 where `fno`=?";
	
	
	public static final String DELETE_COMMENT="delete from `article` where `no`=?";
	public static final String DELETE_FILE="delete from `file` where `ano`=?";
	
	public static final String DELETE_ARTICLE="delete from `article` where `no`=? or `parent`=?";
	public static final String UPDATE_ARTICLE="update `article` set  `title`=?,`content`=?  where `no`=?";//제목,내용 수정
	
	public static final String UPDATE_COMMENT="update `article` set `content`=? where `no`=?";
	public static final String DELETE_DATA = "DELETE a, b "
												+"FROM `article` a "
												+"LEFT JOIN `file` b ON a.no = b.ano "
												+"WHERE a.no = ?";

	public static final String UPDATE_ARTICLE_FOR_FILE_COUNT="UPDATE `Article` SET `file`=`file`-1 WHERE `no`=?";

	public static final String SELECT_FILE_FOR_DELETE = "SELECT `ano`, `sname` FROM `File` WHERE `fno`=?";
	
	public static final String SELECT_FOR_SNAME="select sname from `file` where `ano`=?";

}

