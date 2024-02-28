<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard2.dto.user4DTO"%>
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
	
	//JSON 파싱(JSON 형식의 문자열=>자바객체로 변환)
	Gson gson = new Gson();
	user4DTO user4 = gson.fromJson(requestBody.toString(), user4DTO.class);
	// JSON 문자열을 담고 있는 requestBody를 user4DTO 클래스의 객체로 변환
	
	Context ctx =(Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("insert into `user4` values(?,?,?,?,?,?)");
	psmt.setString(1,user4.getUid());
	psmt.setString(2,user4.getName());
	psmt.setString(3,user4.getGender());
	psmt.setString(4,user4.getAge());
	psmt.setString(5,user4.getHp());
	psmt.setString(6,user4.getAddr());
	
	int result = psmt.executeUpdate();
	
	System.out.println("result : "+result);
	
	psmt.close();
	conn.close();
	
	//서버로부터의 응답을 클라이언트에 출력
	JsonObject json= new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());

%>