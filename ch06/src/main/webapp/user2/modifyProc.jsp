<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid=request.getParameter("uid");
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String addr=request.getParameter("addr");
	
	String host = "jdbc:mysql://127.0.0.1/studydb";
	String user = "oor92";
	String pass = "1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn= DriverManager.getConnection(host,user,pass);
		String sql="update `user2` set `name`=?,`birth`=?,`addr`=? where `uid`=?";
		PreparedStatement psmt= conn.prepareStatement(sql);
		
		psmt.setString(1,name);
		psmt.setString(2,birth);
		psmt.setString(3,addr);
		psmt.setString(4, uid);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
		
	}catch(Exception e){
		e.printStackTrace();		
	}
	response.sendRedirect("./list.jsp");
%>