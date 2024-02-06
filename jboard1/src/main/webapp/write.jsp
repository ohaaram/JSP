<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./_header.jsp" %>
<%
	ArticleDAO arts=ArticleDAO.getInstance();
%>
        <main>
            <section class="write">
                <h3>글쓰기</h3>
                <article>
                    <form action="/jboard1/proc/writeProc.jsp" method="post">
                    	<input type="hidden" name="writer" value="<%=sessUser.getUid() %>">
                        <table>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content"></textarea>                                
                                </td>
                            </tr>
                            <tr>
                                <td>첨부</td>
                                <td><input type="file" name="file"/></td>
                            </tr>
                        </table>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit"  class="btnWrite" value="작성완료">
                            <!--뭘하면 버튼이 생성될까?--><input type="submit" class="btnModify" value="수정완료">
                        </div>
                    </form>
                </article>
            </section>
        </main>
<%@include file="./_footer.jsp"%>