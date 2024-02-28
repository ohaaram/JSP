<%@page import="com.google.gson.JsonObject"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="kr.co.jboard2.dto.user2DTO"%>
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

	//request Body JSON 문자열 스트림 처리
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	String line;
	while((line=reader.readLine())!=null){
		requestBody.append(line);
	}
	reader.close();
	
	//JSON 파싱(JSON형식의 문자열 -> 자바객체로 변환)
	Gson gson = new Gson();
	user2DTO user2 = gson.fromJson(requestBody.toString(),user2DTO.class);
	System.out.println(user2);
	
	//db처리
	
	Context ctx =(Context) new InitialContext().lookup("java:comp/env");
		
	//2단계 - 커넥션을 객체 생성
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	PreparedStatement psmt = conn.prepareStatement("insert into `user2` values(?,?,?,?)");
	
	psmt.setString(1,user2.getUid());
	psmt.setString(2,user2.getName());
	psmt.setString(3,user2.getBirth());
	psmt.setString(4,user2.getAddr());
	
	int result = psmt.executeUpdate();
	
	System.out.println("result : "+result);
	
	psmt.close();
	conn.close();
	
	//JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json.toString());
	
%>