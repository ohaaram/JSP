<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp" %>
<main id="board">
    <section class="view">
        
        <table border="0">
            <caption>글보기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${articleDTO.title}" readonly/></td>
            </tr>
            <c:if test="${articleDTO.file>0}">
            <tr>
                <th>파일</th>
                <td>
                	<c:forEach var="file" items="${articleDTO.fileDTOs}">
                	<p>
                		<a href="/jboard2/fileDownload.do?fno=${file.fno}">${file.oName}</a>&nbsp;<span>${file.download}</span>회 다운로드
                	</p>
                	</c:forEach>
                </td>
            </tr>
            </c:if>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" readonly>${articleDTO.content}</textarea>
                </td>
            </tr>                    
        </table>
        
        <div>
            <a href="/jboard2/delete.do?no=${articleDTO.no}&fno=${file.fno}" class="btn btnRemove">삭제</a>
            <a href="/jboard2/modify.do?no=${articleDTO.no}" class="btn btnModify">수정</a>
            <a href="/jboard2/list.do" class="btn btnList">목록</a>
        </div>

        <!-- 댓글목록 -->
        <section class="commentList">
            <h3>댓글목록</h3>                   

            <article>
                <span class="nick">길동이</span>
                <span class="date">20-05-20</span>
                <p class="content">댓글 샘플 입니다.</p>                        
                <div>
                    <a href="#" class="remove">삭제</a>
                    <a href="#" class="modify">수정</a>
                </div>
            </article>

            <p class="empty">등록된 댓글이 없습니다.</p>

        </section>

        <!-- 댓글쓰기 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="/jboard2/view.do" method="post">
            <input type="text" name="parent" value="${articleDTO.parent}">
                <textarea name="content" >댓글내용 입력</textarea>
                <div>
                    <a href="/jboard2/view.do" class="btn btnCancel">취소</a>
                    <input type="submit" value="작성완료" class="btn btnComplete"/>
                </div>
            </form>
        </section>

    </section>
</main>
<%@ include file="./_footer.jsp" %>