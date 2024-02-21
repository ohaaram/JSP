<%@page import="dto.user5DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dto.user4DTO"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement("select *from `user5` where `seq`=?");
	
	psmt.setString(1,seq);
	
	ResultSet rs = psmt.executeQuery();
	
	user5DTO user5 = null;
	
	if(rs.next()){
		user5= new user5DTO();
		
		user5.setSeq(rs.getString(1));
		user5.setName(rs.getString(2));
		user5.setGender(rs.getString(3));
		user5.setAge(rs.getString(4));
		user5.setAddr(rs.getString(5));
	}
	
	rs.close();
	conn.close();
	psmt.close();
	
	
	Gson gson = new Gson();
	String strJson = gson.toJson(user5);
	out.print(strJson);
	
	

%>