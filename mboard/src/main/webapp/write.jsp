<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            <section class="write">
                <h3>글쓰기</h3>
                <article>
                    <form action="#">
                        <table>
                            <tbody>
                                <tr>
                                    <td>제목</td>
                                    <td>
                                        <input type="text" name="title" placeholder="제목을 입력하세요.">
                                    </td>
                                </tr>
                                <tr>
                                    <td>내용</td>
                                    <td>
                                        <textarea name="content"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>첨부</td>
                                    <td>
                                        <input type="file" name="file">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료">
                        </div>
                    </form>
                </article>
            </section>
        </main>
        <footer>
            <p>copyright 오아람</p>
        </footer>
    </div>  
</body>
</html>