<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard2.dto.user2DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<user2DTO> user2s = new ArrayList<>();
	
	try{
		
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		// 2단계 - 커넥션풀 객체 생성 후 접속객체 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs =stmt.executeQuery("select * from `user2`");
		
		while(rs.next()){
			user2DTO user2 = new user2DTO();
			
			user2.setUid(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setBirth(rs.getString(3));
			user2.setAddr(rs.getString(4));
			
			user2s.add(user2);
		}
		rs.close();
		conn.close();
		stmt.close();	
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//JSON 출력	
	Gson gson = new Gson();
	String strJson = gson.toJson(user2s);
	out.print(strJson);

%>