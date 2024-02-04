<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="dto.user5DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="root";
	String pass="1234";
	
	List<user5DTO> users= new ArrayList<>();
	user5DTO dto=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection(host,user,pass);
		String sql="select * from `user5`";
		Statement stmt= conn.createStatement();
		
		ResultSet rs= stmt.executeQuery(sql);
		
		while(rs.next()){
			dto=new user5DTO();			
			
			dto.setSeq(rs.getString(1));	
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getString(4));
			dto.setAddr(rs.getString(5));
			
			users.add(dto);
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>user5 목록보기</h3>
	<a href="../1.Jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>순서</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>주소</th>
		</tr>
		<%for(user5DTO list:users){ %>
		<tr>
			<td><%=list.getSeq() %></td>
			<td><%=list.getName()%></td>
			<td><%=list.getGender() %></td>
			<td><%=list.getAge() %></td>
			<td><%=list.getAddr() %></td>
		<td>
			<a href="./modify.jsp?seq=<%=list.getSeq() %>">수정</a>
			<a href="./delete.jsp?seq=<%=list.getSeq() %>">삭제</a>
		</td>
		</tr>
		<%} %>
			
	</table>

</body>
</html>