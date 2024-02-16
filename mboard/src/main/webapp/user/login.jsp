<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user::login</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>MBoard System v1.0</h3>
        </header>
        <main>
            <section class="login">
                <form action="/mboard/user/proc/loginProc.jsp">
                    <input type="submit" value="로그인">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <img src="/mboard/images/login_ico_id.png" alt="#">
                                </td>
                                <td>
                                    <input type="text" name="uid" placeholder="아이디 입력">                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="/mboard/images/login_ico_pw.png" alt="#">
                                </td>
                                <td>
                                    <input type="text" name="pass" placeholder="비밀번호 입력">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>아직 회원이 아니시면 회원으로 가입하세요.</p>
                    <a href="#">회원가입</a>
                </div>
            </section>
        </main>
        <footer>
            <p>copyright @오아람.com</p>
        </footer>
    </div>    
</body>
</html>