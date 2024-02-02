<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>GET 요청 결과</h3>
		<%
			String uid=request.getParameter("uid");
			String name=request.getParameter("name");
			String age=request.getParameter("age");	
		%>
		
		<p>
			아이디  : <%=uid %><br>
			이  름 : <%=name %><br>
			나  이 : <%=age %><br>
		</p>
		
		<a href="../1.request.jsp">뒤로가기</a>
	</body>
</html>