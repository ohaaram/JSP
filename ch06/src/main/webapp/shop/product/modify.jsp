<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kr.co.jboard2.dto.productDTO"%>
<%
	request.setCharacterEncoding("UTF-8");

	String prodno=request.getParameter("prodno");
	
	productDTO dto=null;
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn=ds.getConnection();
		
		String sql="select * from `product` where `prodno`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, prodno);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			dto=new productDTO();
			
			dto.setProdno(rs.getString(1));
			dto.setProdname(rs.getString(2));
			dto.setStock(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setCompany(rs.getString(5));
		}
		rs.close();
		conn.close();
		psmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>product::modify</title>
	</head>
	<body>
		<h3>수정하기</h3>
		<a href="../2.DBCP.jsp">처음으로</a>
		<a href="./list.jsp">목록보기</a>
		<form action="./modifyProc.jsp?prodno=<%=dto.getProdno() %>" method="post">
		<table border="1">
			<tr>
				<td>제품이름</td>
				<td><input type="text" name="prodname" value="<%=dto.getProdname() %>"></td>
			</tr>
			
			<tr>
				<td>재고량</td>
				<td><input type="text" name="stock" value="<%=dto.getStock() %>"></td>
			</tr>
			
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="<%=dto.getPrice() %>"></td>
			</tr>
			<tr>
				<td>회사</td>
				<td><input type="text" name="company" value="<%=dto.getCompany() %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		
		</table>
		
		</form>
	</body>
</html>