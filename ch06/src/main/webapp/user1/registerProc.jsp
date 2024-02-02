<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//인코딩 설정
	request.setCharacterEncoding("UTF-8");

	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	//데이터베이스 작업
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="oor92";
	String pass="1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		String SQL="insert into `user1` values(?,?,?,?,?)";
		PreparedStatement psmt=conn.prepareStatement(SQL);	
		psmt.setString(1,uid);
		psmt.setString(2,name);
		psmt.setString(3,birth);
		psmt.setString(4,hp);
		psmt.setString(5,age);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	//목록 이동
	response.sendRedirect("./list.jsp");

%>