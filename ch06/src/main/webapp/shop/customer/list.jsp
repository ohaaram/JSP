<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard2.dto.shopDTO"%>
<%
	List <shopDTO> users = new ArrayList<>();
	shopDTO dto  =null;
	
	try{
		
		Context initCtx=new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");
		
		DataSource ds= (DataSource)ctx.lookup("jdbc/shop");
		Connection conn=ds.getConnection();
		
		String sql="select * from `customer`";
		
		Statement tsmt = conn.createStatement();
		ResultSet rs= tsmt.executeQuery(sql);
		
		while(rs.next()){
			
			dto=new shopDTO();
			
			dto.setCustid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAddr(rs.getString(4));
			dto.setRdate(rs.getString(5));
			
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
		<title>customer::list</title>
	</head>
	<body>
		<h3>Customer 목록</h3>
		
		<a href="../2.DBCP.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
			
			<tr>
			<%for(shopDTO list:users){ %>
				<td><%=list.getCustid() %></td>
				<td><%=list.getName() %></td>
				<td><%=list.getHp() %></td>
				<td><%=list.getAddr() %></td>
				<td><%=list.getRdate() %></td>
				<td>
					<a href="./modify.jsp?custid=<%=list.getCustid()%>">수정</a>
					<a href="./delete.jsp?custid=<%=list.getCustid()%>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>