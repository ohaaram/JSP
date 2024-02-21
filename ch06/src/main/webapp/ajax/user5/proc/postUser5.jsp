<%@page import="dto.user5DTO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="dto.user4DTO"%>
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
	user5DTO user5 = gson.fromJson(requestBody.toString(), user5DTO.class);
	
	Context ctx =(Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("insert into `user5`(`name`,`gender`,`age`,`addr`) values(?,?,?,?)");
	
	psmt.setString(1,user5.getName());
	psmt.setString(2,user5.getGender());
	psmt.setString(3,user5.getAge());
	psmt.setString(4,user5.getAddr());
	
	int result = psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
	//서버로 부터의 응답을 클라이언트에 출력(json자체는 아무 데이터가 없음 ,json.result값은 1이 있고 이걸 넘기기위한 코드)
	JsonObject json = new JsonObject();
	json.addProperty("result",result);
	out.print(json.toString());

	
%>