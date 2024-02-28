<%@page import="kr.co.jboard2.dto.user3DTO"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("select * from `user3` where `uid`=?");
	psmt.setString(1,uid);
	
	ResultSet rs = psmt.executeQuery();
	
	user3DTO user3 = null;
	
	if(rs.next()){
		user3 = new user3DTO();
		
		user3.setUid(rs.getString(1));
		user3.setName(rs.getString(2));
		user3.setBirth(rs.getString(3));
		user3.setHp(rs.getString(4));
		user3.setAddr(rs.getString(5));
	}
	rs.close();
	conn.close();
	psmt.close();
	
	//JSON출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user3);
	out.print(strJson);//이게 Json을 문자열로 만들어서 폼에 뿌려주네
	

%>