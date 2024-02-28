<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member::list</title>
	</head>
	<body>
		<h3>member 목록</h3>
		<a href="/ch11/index.jsp">처음으로</a>
		<a href="/ch11/member/register.do">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
				<th>입사일</th>
				<th>관리</th>
			</tr>
			<c:forEach var = "user" items ="${users}">
			<tr>
				<!-- 표현언어에서는 직접 private 속성을 참조할 수 있음 -->
				<td>${user.getUid()}</td>
				<td>${user.getName()}</td>
				<td>${user.getHp()}</td>
				<td>${user.getPos()}</td>
				<td>${user.getDep()}</td>
				<td>${user.getRdate()}</td>
				<td>
					<a href="/ch11/member/modify.do?uid=${user.getUid()}">수정</a>
					<a href="/ch11/member/delete.do?uid=${user.getUid()}">삭제</a>
				</td>
			</tr>
			</c:forEach>	
		</table>		
	</body>
</html>