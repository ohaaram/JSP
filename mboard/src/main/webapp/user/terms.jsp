<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>terms</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div id="container">
        <header>
            <h3>MBoard System v1.0</h3>
        </header>
        <main>
            <section class="terms">
                <table>
                    <caption>사이트 이용약관</caption>
                    <tbody>
                        <tr>
                            <td>
                                <textarea readonly>약관내용</textarea>
                                <p>
                                    <label>
                                        <input type="checkbox" name="agree1">
                                        동의합니다.
                                    </label>
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <caption>개인 정보 취급방침</caption>
                    <tbody>
                        <tr>
                            <td>
                                <textarea readonly>약관내용</textarea>
                                <p>
                                    <label>
                                        <input type="checkbox" name="agree2">
                                        동의합니다.
                                    </label>
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <a href="#" class="btnCancel">취소</a>
                    <a href="#" class="btnNext">다음</a>
                </div>
            </section>
        </main>    
        <footer>
            <p>copyright @오아람.com</p>
        </footer> 
    </div>
</body>
</html>