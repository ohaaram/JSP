<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();//현재 클라이언트 세션 삭제
	
	//자동 로그인 쿠키삭제
	Cookie cookie = new Cookie("cid",null);//사용자 id를 null로 보냄
	cookie.setMaxAge(0);//수명 0
	cookie.setPath("/ch05");
	response.addCookie(cookie);
	
	//로그인 화면 이동
	response.sendRedirect("../2.Session.jsp?logout=success");
%>
