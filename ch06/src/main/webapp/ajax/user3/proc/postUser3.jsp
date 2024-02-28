<%@page import="com.google.gson.JsonObject"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="kr.co.jboard2.dto.user3DTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	
	String line;
	
	while((line=reader.readLine())!=null){
		requestBody.append(line);
	}
	reader.close();
	
	//JSON 파싱(JSON형식의 문자열 -> 자바객체로 변환)
	Gson gson = new Gson();
	user3DTO user3 = gson.fromJson(requestBody.toString(),user3DTO.class);
	System.out.println(user3);
	
	Context ctx =(Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("insert into `user3` values(?,?,?,?,?)" );
	
	psmt.setString(1,user3.getUid());
	psmt.setString(2,user3.getName());
	psmt.setString(3,user3.getBirth());
	psmt.setString(4,user3.getHp());
	psmt.setString(5,user3.getAddr());
	
	int result = psmt.executeUpdate();
	
	System.out.println("result : "+result);
	
	psmt.close();
	conn.close();
	
	
	//JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());
	

%>