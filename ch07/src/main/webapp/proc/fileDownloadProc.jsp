<%@page import="java.awt.image.DataBufferDouble"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="ch07.dto.FileDTO"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String fno = request.getParameter("fno");
	
	//다운로드 할 파일 정보 조회
	FileDTO fileDTO = null;
	
	try {
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경이름
	
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
	
		Statement stmt = conn.createStatement();
	
		ResultSet rs = stmt.executeQuery("select * from `filetest` where `fno`=" + fno);
		
		if (rs.next()) {
	
			fileDTO = new FileDTO();
	
			fileDTO.setFno(rs.getInt(1));
			fileDTO.setTitle(rs.getString(2));
			fileDTO.setOname(rs.getString(3));
			fileDTO.setSname(rs.getString(4));
			fileDTO.setRdate(rs.getString(5));	
		}
	
		stmt.close();
		rs.close();
		conn.close();
	
	} catch (Exception e) {
		e.printStackTrace();
	}

	//다운로드 헤더 설정	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileDTO.getOname(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	//response 파일 스트림 작업
	String uploadsPath = application.getRealPath("/uploads");
	File file = new File(uploadsPath + File.separator + fileDTO.getSname());
	
	
	
	out.clear();
	out = pageContext.pushBody();//실행은 되는데 이상한 에러가 떠서 이 줄을 추가해줌.
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while (true) {
		int data = bis.read();
		if (data == -1) {
			break;
		}
		bos.write(data);
	}
	
	bos.close();
	bis.close();
%>