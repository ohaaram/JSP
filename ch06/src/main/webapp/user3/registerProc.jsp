<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid=request.getParameter("uid");
	System.out.println("uid : "+uid);
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="root";
	String pass="1234";
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn= DriverManager.getConnection(host,user,pass);
		
		String sql="insert into `user3` values(?,?,?,?,?)";
		
		PreparedStatement psmt= conn.prepareStatement(sql);
		
		psmt.setString(1,uid);
		psmt.setString(2,name);
		psmt.setString(3,birth);
		psmt.setString(4,hp);
		psmt.setString(5,addr);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>