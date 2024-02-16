package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBHelper {
	
	protected Connection conn=null;
	protected Statement stmt=null;
	protected PreparedStatement psmt=null;
	protected PreparedStatement psmtEct1=null;
	protected PreparedStatement psmtEct2=null;
	protected ResultSet rs=null;
	
	
	public Connection getConnection() throws NamingException, SQLException {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/jboard");
		return ds.getConnection();
	}
	
	public void closeAll() throws SQLException {
		if(conn!=null)
			conn.close();
		if(rs!=null)
			rs.close();
		if(stmt!=null)
			stmt.close();
		if(psmt!=null)
			psmt.close();
		if(psmtEct1!=null)
			psmtEct1.close();
		if(psmtEct2!=null)
			psmtEct2.close();
	}	
}
