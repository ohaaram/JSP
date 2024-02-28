<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard2.dto.user4DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<user4DTO> user4s = new ArrayList<>();
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs =stmt.executeQuery("select * from `user4`");
		
		while(rs.next()){
			user4DTO user4 = new user4DTO();
			
			user4.setUid(rs.getString(1));
			user4.setName(rs.getString(2));
			user4.setGender(rs.getString(3));
			user4.setAge(rs.getString(4));
			user4.setHp(rs.getString(5));
			user4.setAddr(rs.getString(6));
			
			user4s.add(user4);
		}
		
		rs.close();
		conn.close();
		stmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	Gson gson = new Gson();
	String strJson = gson.toJson(user4s);
	out.print(strJson);

%>