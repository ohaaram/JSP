<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.includeTag</title>
		<!-- 
			날짜 : 2024/01/31
			이름 : 오아람
			내용 : JSP 액션태그 useBean 실습
		 -->
	</head>
	<body>
		<h3>3.useBean 액션태그</h3>
		
		<!--  폼에 있는 데이터를 action으로 보냄-->
		<form action="./proc/userProc.jsp" method="get">
			<input type="text" name="uid"/><br>
			<input type="text" name="name"/><br>
			<input type="text" name="age"/><br>
			<input type="text" name="addr"/><br>
			<input type="submit" value="전송"/>		
		</form>
		
	</body>
</html>