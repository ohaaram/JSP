<%@page import="kr.co.jboard1.dao.userDAO"%>
<%@page import="kr.co.jboard1.dto.userDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String regip = request.getRemoteAddr();
	
	// 회원 객체 생성
	userDTO user = new userDTO();
	user.setUid(uid);
	user.setPass(pass1);
	user.setName(name);
	user.setNick(nick);
	user.setEmail(email);
	user.setHp(hp);
	user.setRegip(regip);
	
	// 회원 등록
	userDAO.getInstance().insertUser(user);
	
	// 로그인 이동
	response.sendRedirect("/jboard1/user/login.jsp");
%>