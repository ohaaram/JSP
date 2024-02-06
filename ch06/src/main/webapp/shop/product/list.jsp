<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.productDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List <productDTO> users = new ArrayList<>();
	productDTO dto=null;
	
	try{
		Context iniContext = new InitialContext();
		Context ctx=(Context)iniContext.lookup("java:comp/env");
		
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn=ds.getConnection();
		
		String sql="select * from `product`";
		
		Statement tsmt=conn.createStatement();
		ResultSet rs= tsmt.executeQuery(sql);
		
		while(rs.next()){
			dto=new productDTO();
			
			dto.setProdno(rs.getString(1));
			dto.setProdname(rs.getString(2));
			dto.setStock(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setCompany(rs.getString(5));
			
			users.add(dto);
		}
		
		conn.close();
		rs.close();
		tsmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>product::list</title>
	</head>
	<body>
		<h3>proudct 목록</h3>
		
		<a href="../2.DBCP.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>제품번호</th>
				<th>제품이름</th>
				<th>재고량</th>
				<th>가격</th>
				<th>회사</th>
				<th>관리</th>
			</tr>
			
			<tr>
			<%for(productDTO list:users) {%>
				<td><%=list.getProdno() %></td>
				<td><%=list.getProdname() %></td>
				<td><%=list.getStock() %></td>
				<td><%=list.getPrice() %></td>
				<td><%=list.getCompany() %></td>
				<td>
					<a href="./modify.jsp?prodno=<%=list.getProdno() %>">수정</a>
					<a href="./delete.jsp?prodno=<%=list.getProdno() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
		
	</body>
</html>