<%@page import="sub1.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid= request.getParameter("uid");
	String pass = request.getParameter("pass");
	String auto = request.getParameter("auto");
	
	//사용자가 abc12324 비밀번호 : 1234 일경우 회원으로 간주
	if(uid.equals("abc1234")&& pass.equals("1234")){
		//회원일 경우 
		
		//자동 로그인 처리
		if(auto!=null){
			Cookie autoCookie=new Cookie("cid",uid);
			//사용자의 최소한의 정보만 쿠키로 만들어야 한다.
			autoCookie.setMaxAge(60*3);
			autoCookie.setPath("/ch05");
			response.addCookie(autoCookie);
		}
		
		
		//사용자 생성
		UserDTO user = new UserDTO();
		user.setUid(uid);
		user.setPass(pass);
		user.setName("홍길동");
		user.setAge(23);
		
		//세션에 회원을 기록(핵심!)
		session.setAttribute("sessUser", user);
		
		//이동
		response.sendRedirect("./loginSuccess.jsp");
		
		
	}else{
		//회원이 아닐 경우
		response.sendRedirect("../2.Session.jsp?result=100");
	}
%>