<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>list</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <div id="container">
        <header>
            <h3>Mboard v1.0</h3>
            <p>
                <span id="nick">홍길동</span>
                님 반갑습니다.
                <a href="#" class="logout">로그아웃</a>
            </p>
        </header>
        <main>
            <section class="list">
                <h3>글 목록</h3>
                <article>
                    <table>
                        <tbody>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>날짜</th>
                                <th>조회</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <a href="#">테스트 제목1입니다.</a>
                                    [3]
                                </td>
                                <td>길동이</td>
                                <td>24-01-29</td>
                                <td>12</td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <!--페이지네이션-->
                <div class="paging">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="num current">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="num">4</a>
                    <a href="#" class="num">5</a>
                    <a href="#" class="next">다음</a>
                </div>
                <div>
                    <a href="#" class="btnWrite">글쓰기</a>
                </div>
            </section>
        </main>
        <footer>
            <p>copyright 오아람</p>
        </footer>
    </div>    
</body>
</html>