<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.user4DTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="root";
	String pass="1234";
	
	List <user4DTO> users = new ArrayList<>();
	user4DTO dto  =null;

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		String sql="select * from `user4`";
		Statement tsmt =  conn.createStatement();
		ResultSet rs= tsmt.executeQuery(sql);
		
		while(rs.next()){
			dto=new user4DTO();
			
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getString(4));
			dto.setHp(rs.getString(5));
			dto.setAddr(rs.getString(6));
			
			users.add(dto);
		}
		
		conn.close();
		rs.close();
		tsmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>




<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::list</title>
	</head>
	<body>
		<h3>user4 목록</h3>
		<a href="../1.Jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성</th>
				<th>나이</th>
				<th>휴대폰</th>
				<th>주소</th>
			</tr>
			<%for(user4DTO list:users) {%>
			<tr>
				<td><%=list.getUid() %></td>
				<td><%=list.getName() %></td>
				<td><%=list.getGender() %></td>
				<td><%=list.getAge() %></td>
				<td><%=list.getHp() %></td>
				<td><%=list.getAddr() %></td>
				<td>
					<a href="./modify.jsp?uid=<%=list.getUid()%>">수정</a>	
					<a href="./delete.jsp?uid=<%=list.getUid()%>">삭제</a>
				</td>
			</tr>
			<%} %>	
		
		</table>
		
	</body>
</html>