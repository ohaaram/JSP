package DB;

public class SQL {
	
	public static final String SELECT_USER_FOR_LOGIN="select * from `user` where `uid`=? and `pass`=SHA2(?,256)";

}
