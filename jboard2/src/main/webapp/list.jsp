<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp" %>
<main id="board">
    <section class="list">                
        <form action="#" class="search">
            <select name="searchType">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="title_content">제목+내용</option>
                <option value="writer">작성자</option>
            </select>
            <input type="text" name="keyword" placeholder="검색 키워드 입력">
            <input type="submit" value="검색">
        </form>
        
        <table border="0">
            <caption>글목록</caption>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <c:forEach var = "list" items="${article}">                    
            <tr>
                <td>${list.getNo()}</td>
                <td><a href="/jboard2/view.do?no=${list.getNo()}">${list.getTitle() }</a></td>
                <td>${list.getWriter()}</td>
                <td>${list.getRdate()}</td>
                <td>${list.getHit()}</td>
            </tr>
            </c:forEach>
        </table>

		<!-- 페이지 네이션 -->
        <div class="page">     
        	<c:if test = "${pageGropStart>1}">
            <a href="./list.do?pg=${pageGroupStart-1}" class="prev">이전</a>
            </c:if>
            <c:forEach var="i" begin ="${pageGroupStart}" end="${pageGroupEnd}">
            <a href="./list.do?pg=${i}" class="num ${currentPage==i? 'current' : 'off' }">${i}</a>           
            </c:forEach>
            <c:if test = "${pageGroupEnd < lastPageNum}">
            <a href="./list.do?pg=${pageGroupEnd+1}" class="next">다음</a>
            </c:if>
        </div>
        <a href="/jboard2/write.do" class="btn btnWrite">글쓰기</a>
    </section>
</main>
<%@ include file="./_footer.jsp" %>