<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String prodno=request.getParameter("prodno");
	String prodname=request.getParameter("prodname");
	String stock=request.getParameter("stock");
	String price=request.getParameter("price");
	String company=request.getParameter("company");
	
	try{
		Context initContext = new InitialContext();
		Context ctx = (Context)initContext.lookup("java:comp/env");
		
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn  = ds.getConnection();
		
		String sql="update `product` set `prodname`=?,`stock`=?,`price`=?,`company`=? where `prodno`=?";
		PreparedStatement psmt= conn.prepareStatement(sql);
		psmt.setString(1,prodname);
		psmt.setString(2,stock);
		psmt.setString(3,price);
		psmt.setString(4,company);
		psmt.setString(5,prodno);
		
		System.out.println(psmt);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>