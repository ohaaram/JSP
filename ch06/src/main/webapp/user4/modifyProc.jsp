<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid=request.getParameter("uid");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String age=request.getParameter("age");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="root";
	String pass="1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn= DriverManager.getConnection(host,user,pass);
		String sql="update `user4` set `name`=?,`gender`=?,`age`=?,`hp`=?,`addr`=? where `uid`=?";
		PreparedStatement psmt= conn.prepareStatement(sql);
		
		psmt.setString(1, name);
		psmt.setString(2,gender);
		psmt.setString(3, age);
		psmt.setString(4,hp);
		psmt.setString(5,addr);
		psmt.setString(6,uid);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");

%>