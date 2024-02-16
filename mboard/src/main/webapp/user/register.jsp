<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div id="container">
        <header>
            <h3>MBoard System v1.0</h3>
        </header>
        <main>
            <section class="register">
                <form action="#">
                    <table border="0">
                        <caption>사이트 이용 정보 입력</caption>
                        <tbody>
                            <tr>
                                <td>아이디</td>
                                <td>
                                    <input type="text" name="uid" placeholder="아이디 입력">
                                    <button>
                                        <img src="../images/chk_id.gif" alt="아이디중복확인">
                                        <span class="result_uid"></span>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td>
                                    <input type="text" name="pass1" placeholder="비밀번호 입력">
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호 확인</td>
                                <td>
                                    <input type="text" name="pass2" placeholder="비밀번호 입력 확인">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table border="0">
                        <caption>개인정보 입력</caption>
                        <tbody>
                            <tr>
                                <td>이름</td>
                                <td>
                                    <input type="text" name="name" placeholder="이름 입력">
                                </td>
                            </tr>
                            <tr>
                                <td>별명</td>
                                <td>
                                    <p>공백없이 한글,영문,숫자만 입력가능</p>
                                    <input type="text" name="nick" placeholder="별명 입력">
                                </td>
                            </tr>
                            <tr>
                                <td>E-mail</td>
                                <td>
                                    <input type="text" name="email" placeholder="이메일 입력">
                                </td>
                            </tr>
                            <tr>
                                <td>휴대폰</td>
                                <td>
                                    <input type="text" name="hp" placeholder="-포함 13자리 입력">
                                </td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td>
                                    <div>
                                        <input type="text" name="zip" placeholder="우편번호" readonly>
                                        <button>
                                            <img src="../images/chk_post.gif" alt="우편번호 검색">
                                        </button>
                                    </div>
                                    <div>
                                        <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly>
                                    </div>
                                    <div>
                                        <input type="text" name="addr2" placeholder="상세주소를 입력하세요.">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>  
                    <div>
                        <a href="#" class="btnCancel">취소</a>             
                        <a href="#" class="btnSubmit">회원가입</a>             
                   </div>
                </form>
            </section>
        </main>
        <footer>
            <p>copyright @오아람.com</p>
        </footer>    
</body>
</html>