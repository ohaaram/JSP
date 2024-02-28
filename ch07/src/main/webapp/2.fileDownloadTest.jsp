<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="ch07.dto.FileDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<FileDTO> files = new ArrayList<>();

	
	FileDTO file = null;
	try{
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경이름
				
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from `filetest`");
		
		while(rs.next()){
			file = new FileDTO();
			file.setFno(rs.getInt(1));
			file.setTitle(rs.getString(2));
			file.setOname(rs.getString(3));
			file.setSname(rs.getString(4));
			file.setRdate(rs.getString(5));		
			
			files.add(file);
		}
		
		stmt.close();
		rs.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.fileDownloadTest</title>		
		<!-- 
			날짜 : 2024/02/19
			이름 : 오아람
			내용 : JSP 파일 다운로드 실습하기
		 -->
	</head>
	</head>
	<body>
		<h3>2.파일 다운로드</h3>
		<a href="1.fileUploadTest.jsp">파일 업로드</a>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>원본파일명</th>
				<th>저장파일명</th>
				<th>날짜</th>
				<th>관리</th>
				
			</tr>	
			<%for(FileDTO dto:files){ %>		
			<tr>
				<td><%=dto.getTitle() %></td>
				<td><%=dto.getTitle() %></td>
				<td><%=dto.getOname() %></td>
				<td><%=dto.getSname() %></td>
				<td><%=dto.getRdate() %></td>
				<td>
				<a href = "./proc/fileDownloadProc.jsp?fno=<%=dto.getFno()%>">다운로드</a>
				<a href = "./proc/fileDeleteProc.jsp?fno=<%=dto.getFno()%>">삭제</a>
			</tr>
			<%} %>			
		</table>
		
		
	</body>
</html>