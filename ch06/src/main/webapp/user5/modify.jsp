<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard2.dto.user5DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String seq=request.getParameter("seq");
	
	String host="jdbc:mysql://127.0.0.1/studydb";
	String user="root";
	String pass="1234";
	
	user5DTO dto=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection(host,user,pass);
		String sql="select * from `user5` where `seq`=?";
		PreparedStatement psmt=conn.prepareStatement(sql);
		psmt.setString(1, seq);
		
		ResultSet rs=psmt.executeQuery();
		
		if(rs.next()){
			dto=new user5DTO();
			
			dto.setSeq(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getString(4));
			dto.setAddr(rs.getString(5));
		}
		rs.close();
		conn.close();
		psmt.close();
		
		
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
	<h3>user5 수정</h3>
	<a href="../1.Jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록으로</a>
	<form action="./modifyProc.jsp?seq=<%=dto.getSeq() %>" method="post">
		<table border="1">

			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td><input type="text" name="gender" value="<%=dto.getGender() %>"></td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value="<%=dto.getAge() %>"></td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=dto.getAddr() %>"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>	
		</table>
	
	</form>

</body>
</html>