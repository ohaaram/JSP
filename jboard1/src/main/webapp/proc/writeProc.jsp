<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title =request.getParameter("title");
	String content=request.getParameter("content");
	String file=request.getParameter("file");
	String writer=request.getParameter("writer");
	String regip=request.getRemoteAddr();
	
	ArticleDTO art=new ArticleDTO();
	
	art.setTitle(title);
	art.setContent(content);
	art.setWriter(writer);
	art.setRegip(regip);
	
	ArticleDAO.getInstance().insertArticle(art);
	
	response.sendRedirect("/jboard1/list.jsp");

%>