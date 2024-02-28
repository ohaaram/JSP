<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::list</title>
	</head>
	<body>
			<h3>user5 목록</h3>
		<a href="/ch10/index.jsp">처음으로</a>
		<a href="/ch10/user5/register.do">등록하기</a>
		<table border="1">
			<tr>
				<th>순번</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<c:forEach var = "user" items ="${users}">
			<tr>
				<!-- 표현언어에서는 직접 private 속성을 참조할 수 있음 -->
				<td>${user.getSeq()}</td>
				<td>${user.getName()}</td>
				<td>${user.getGender()}</td>
				<td>${user.getAge()}</td>
				<td>${user.getAddr()}</td>
				<td>
					<a href="/ch10/user5/modify.do?seq=${user.seq}">수정</a>
					<a href="/ch10/user5/delete.do?seq=${user.seq}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
	</table>
		
	</body>
</html>