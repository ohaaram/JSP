<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid=request.getParameter("uid");
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="oor92";
	String pass="1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn  =DriverManager.getConnection(host,user,pass);
		
		String sql="update `user3` set `name`=?,`birth`=?,`hp`=?,`addr`=? where `uid`=?";
		PreparedStatement pstmt= conn.prepareStatement(sql);
		
		pstmt.setString(1,name);
		pstmt.setString(2,birth);
		pstmt.setString(3,hp);
		pstmt.setString(4,addr);
		pstmt.setString(5,uid);
		
		pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>