<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard2.dto.user5DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<user5DTO> user5s = new ArrayList<>();
	
	try{
		
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `user5`");
		
		while(rs.next()){
			user5DTO user5 = new user5DTO();
			
			user5.setSeq(rs.getString(1));
			user5.setName(rs.getString(2));
			user5.setGender(rs.getString(3));
			user5.setAge(rs.getString(4));
			user5.setAddr(rs.getString(5));
			
			
			user5s.add(user5);
		}
		rs.close();
		conn.close();
		stmt.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
	
	Gson gson = new Gson();
	String strJson = gson.toJson(user5s);
	out.println(strJson);

%>