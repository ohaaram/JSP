<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid= request.getParameter("uid");
	String name= request.getParameter("name");
	String gender= request.getParameter("gender");
	String age= request.getParameter("age");
	String hp= request.getParameter("hp");
	String addr= request.getParameter("addr");
	
	int result =0;
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("update `user4` set `name`=?,`gender`=?,`age`=?,`hp`=?,`addr`=? where `uid`=?");
		
		psmt.setString(1,name);
		psmt.setString(2,gender);
		psmt.setString(3,age);
		psmt.setString(4,hp);
		psmt.setString(5,addr);
		psmt.setString(6,uid);
		
		result = psmt.executeUpdate();
		
		
		
	}catch(Exception e){
		
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());
%>