<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.userDAO"%>
<%@page import="javax.xml.crypto.URIDereferencer"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String value = request.getParameter("value");

	
	System.out.println("type : "+type);
	
	userDAO dao  = userDAO.getInstance();
	
	int result = dao.selectCountUser(type, value);
	
	//JSON출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	json.addProperty("type", type);
	
	out.print(json.toString());
	

%>