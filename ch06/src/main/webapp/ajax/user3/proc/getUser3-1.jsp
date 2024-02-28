<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.co.jboard2.dto.user3DTO"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User3` WHERE `uid`=?");
	psmt.setString(1, uid);
	
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
	psmt.close();
	conn.close();
	
	Gson gson = new Gson();
	String strJson = gson.toJson(user3);
	out.print(strJson);
%>