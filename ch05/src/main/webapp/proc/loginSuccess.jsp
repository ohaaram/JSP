<%@page import="sub1.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserDTO user= (UserDTO)session.getAttribute("sessUser");
	if(user==null){//로그인 안하고 들어온거 
		response.sendRedirect("../2.Session.jsp?login=require");
		return ;//처리 종료 아니면 밑에 실행이 되면서 500에러뜸(nullpoint)
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginSuccess</title>
	</head>
	<body>
		<h3>로그인에 성공하였습니다!</h3>
		
		<p>
			<%= user.getName()%>님 반갑습니다.<br>
			<a href="./logout.jsp">로그아웃</a>
		</p>
	</body>
</html>