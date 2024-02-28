<%@page import="ch07.dto.FileDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
		
		conn.setAutoCommit(false);
		
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
	
		
		PreparedStatement psmt = conn.prepareStatement("delete from `filetest` where `fno`=?");
		psmt.setString(1,fno);
		psmt.executeUpdate();//db에서 삭제	
		
		conn.commit();//커밋확정
		
		stmt.close();
		rs.close();
		psmt.close();
		conn.close();
	
	} catch (Exception e) {
		e.printStackTrace();
	}

	String deletePath = application.getRealPath("/uploads");
	File file = new File(deletePath+File.separator+fileDTO.getSname());
	
	out.clear();
	out = pageContext.pushBody();//실행은 되는데 이상한 에러가 떠서 이 줄을 추가해줌.

	if (file!=null) {
		file.delete();
	}

	response.sendRedirect("../2.fileDownloadTest.jsp");
%>