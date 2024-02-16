<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String chk1=request.getParameter("chk1");//체크가 다 되면 on으로 값을 넘김
	String chk2=request.getParameter("chk2");
	String sms=request.getParameter("sms");
	
	try{
	
		if(chk1.equals("on") && chk2.equals("on")){
		
			session.setAttribute("agree", true);
			
			if(sms!=null){
				session.setAttribute("sms", "y");
			}else{
				session.setAttribute("sms", "n");
			}
			
			response.sendRedirect("/jboard1/user/register.jsp");
		
		}else{
			response.sendRedirect("jboard1/user/terms.jsp?code=300");		
		}
		
	}catch(Exception e){
		e.printStackTrace();
		
		response.sendRedirect("jboard1/user/terms.jsp?code=300");
	}
%>