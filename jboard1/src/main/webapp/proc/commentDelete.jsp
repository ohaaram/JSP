<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String parent = request.getParameter("parent");
	String no =request.getParameter("no");

	ArticleDAO dao=ArticleDAO.getInstance();
	dao.deleteComment(no,parent);
	
	response.sendRedirect("/jboard1/view.jsp?no="+parent);
%>