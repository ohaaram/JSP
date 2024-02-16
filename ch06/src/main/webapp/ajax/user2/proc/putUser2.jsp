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
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String addr=request.getParameter("addr");
	
	int result=0;
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("update `user2` set `name`=?,`birth`=?,`addr`=? where `uid`=?");
		
		psmt.setString(1,name);
		psmt.setString(2,birth);
		psmt.setString(3,addr);
		psmt.setString(4,uid);
		
		result = psmt.executeUpdate();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//JSON출력
	JsonObject json =  new JsonObject();
	json.addProperty("result", result);//JSON속성 추가(키:값)
	out.print(json.toString());
	System.out.println("json.toString:"+json.toString());

%>