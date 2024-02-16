<%@page import="DTO.userDTO"%>
<%@page import="DAO.userDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	userDTO user = userDAO.getInstance().selectUserForLogin(uid, pass);
	
	if(user!=null){
		session.setAttribute("sessUser", user);//세션에다가 user의 정보를 저장함.
		response.sendRedirect("/mboard/list.jsp");
	}else{
		response.sendRedirect("/mboard/user/login.jsp?code=100");//코드는 내가 정하기 나름?
	}	
	
%>
