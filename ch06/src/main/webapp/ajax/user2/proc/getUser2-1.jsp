<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard2.dto.user2DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	System.out.println(uid);
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User2` WHERE `uid`=?");
	psmt.setString(1, uid);
	
	ResultSet rs = psmt.executeQuery();
	
	user2DTO user2 = null;
	if(rs.next()) {
		user2 = new user2DTO();
		user2.setUid(rs.getString(1));
		user2.setName(rs.getString(2));
		user2.setBirth(rs.getString(3));
		user2.setAddr(rs.getString(4));
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	//Json 출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user2);
	out.print(strJson);
%>