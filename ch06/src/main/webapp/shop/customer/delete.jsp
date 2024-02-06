<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	try{
		request.setCharacterEncoding("UTF-8");
		String custid=request.getParameter("custid");
	
		Context iniContext = new InitialContext();
		Context ctx= (Context)iniContext.lookup("java:comp/env");
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/shop");
		Connection conn= ds.getConnection();
		
		String sql="delete from `customer` where `custid`=?";
		PreparedStatement psmt= conn.prepareStatement(sql);
		
		psmt.setString(1, custid);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("./list.jsp");

%>
