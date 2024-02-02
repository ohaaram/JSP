<%@page import="java.sql.ResultSet"%>
<%@page import="dto.user3DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="oor92";
	String pass="1234";
	
	List <user3DTO> users = new ArrayList<>();
	user3DTO dto  =null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host,user,pass);
		String sql="select * from `user3`";
		Statement stmt= conn.createStatement();
		
		ResultSet rs= stmt.executeQuery(sql);
		
		while(rs.next()){
			
			 dto = new user3DTO();			 
			 
			 dto.setUid(rs.getString(1));
			 dto.setName(rs.getString(2));
			 dto.setBirth(rs.getString(3));
			 dto.setHp(rs.getString(4));
			 dto.setAddr(rs.getString(5));	
			 
			 users.add(dto);
		}	
		
		conn.close();
		rs.close();
		stmt.close();
		
	}catch(Exception e){
		e.printStackTrace();		
	}


%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user3::list</title>
	</head>
	<body>
		<h3>user3 목록</h3>
		<a href="../1.Jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<% for(user3DTO list: users){ %>
			<tr>
				<td><%=list.getUid() %></td>
				<td><%=list.getName() %></td>
				<td><%=list.getBirth() %></td>
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