<%@page import="kr.co.jboard1.dao.userDAO"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="kr.co.jboard1.dto.termsDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	termsDTO dto = userDAO.getInstance().selectTerms();
%>
<%@ include file="./_header.jsp" %>
<script>
	window.onload=function(){
		
		const chk1=document.getElementsByName('chk1')[0];
		const chk2=document.getElementsByName('chk2')[0];
		
		const btnNext = document.getElementsByClassName('btnNext')[0];
		
		btnNext.onclick=()=>{

			if(chk1.checked && chk2.checked){
				
				document.frmTerms.submit();//폼전송으로 동의체크한거 넘김
				
			}else{
				alert('동의 체크를 하셔야합니다.');
				return false;
			}			
		}
	}
</script>
<main>
    <section class="terms">
    <form action="/jboard1/user/proc/termsProc.jsp" name="frmTerms" method="post">
    
        <table>
            <caption>사이트 이용약관</caption>
            <tr>
                <td>
                    <textarea readonly><%= dto.getTerms() %></textarea>
                    <p>
                        <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        <table>
            <caption>개인정보 취급방침</caption>
            <tr>
                <td>
                    <textarea readonly><%= dto.getPrivacy() %></textarea>
                    <p>
                        <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        <table>
            <caption>마케팅 수신동의(선택)</caption>
            <tr>
                <td>
                    <textarea readonly><%= dto.getSms() %></textarea>
                    <p>
                        <label><input type="checkbox" name="sms" value="y"/>동의합니다.</label>
                    </p>
                </td>
            </tr>
        </table>
        </form>
        <div>
            <a href="/jboard1/user/login.jsp" class="btnCancel">취소</a>
            <a href="#" class="btnNext">다음</a>
        </div>
    </section>
</main>
<%@ include file="./_footer.jsp" %>