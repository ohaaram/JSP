<%@page import="com.google.gson.Gson"%>
<%@page import="kr.co.jboard2.dto.user4DTO"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("select * from `user4` where `uid`=?");
	psmt.setString(1,uid);
	
	ResultSet rs = psmt.executeQuery();
	
	user4DTO user4 = null;
	
	if(rs.next()){
		user4 = new user4DTO();
		
		user4.setUid(rs.getString(1));
		user4.setName(rs.getString(2));
		user4.setGender(rs.getString(3));
		user4.setAge(rs.getString(4));
		user4.setHp(rs.getString(5));
		user4.setAddr(rs.getString(6));
		
	}
	
	rs.close();
	conn.close();
	psmt.close();
	
	//JSON출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user4);
	out.print(strJson);

%>