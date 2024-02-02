<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%
	request.setCharacterEncoding("UTF-8");

	String uid=request.getParameter("uid");
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String hp=request.getParameter("hp");
	String age=request.getParameter("age");
	
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="oor92";
	String pass="1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		String sql="UPDATE `user1` SET NAME=?,birth=?,hp=?,age=? WHERE `uid`=?;";		
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,name);
		psmt.setString(2,birth);
		psmt.setString(3,hp);
		psmt.setString(4,age);
		psmt.setString(5,uid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
	response.sendRedirect("./list.jsp");

%>