<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="dto.user1DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// request Body JSON 문자열 스트림 처리
	request.setCharacterEncoding("UTF-8");
	
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	String line;
	while((line = reader.readLine()) != null){
		requestBody.append(line);
	}
	reader.close();
	
	// JSON 파싱
	Gson gson = new Gson();
	user1DTO user1 = gson.fromJson(requestBody.toString(),user1DTO.class);
	System.out.println(user1);
	
	//데이터베이스 처리
	
	Context ctx =(Context) new InitialContext().lookup("java:comp/env");
		
	//2단계 - 커넥션을 객체 생성
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	PreparedStatement psmt = conn.prepareStatement("insert into `user1` values(?,?,?,?,?)");
	
	psmt.setString(1,user1.getUid());
	psmt.setString(2,user1.getName());
	psmt.setString(3,user1.getBirth());
	psmt.setString(4,user1.getHp());
	psmt.setInt(5,user1.getAge());
	
	int result = psmt.executeUpdate();//row count를 반환함(지금은 1을 반환)
	//만약 넣을값이 중복되는 값이라면 row count값이 0이 반환됨.
	
	System.out.println("result : "+result);
	
	psmt.close();
	conn.close();
	
	//JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json.toString());
	
	
%>