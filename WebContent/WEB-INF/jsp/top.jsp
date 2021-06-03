<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>大学受験生向け書籍販売サイト「ポスタゴン」ログインページ</title>
<link rel="stylesheet" href="./css/form_button.css">
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
  <jsp:include page="/WEB-INF/jsp/header.jsp" />
  <form action="/posutagonbook/LoginServlet" method="post">
    <ul>
      <li>ユーザー名：<input type="text" name="user_id"><br>
      <li>パスワード：<input type="password" name="pass"><br>
        <input type="submit" value="ログイン">
    </ul>
  </form>
  <form action="/posutagonbook/RegisterServlet" method="get">
    <input type="submit" value="     新規登録の方はこちら" class="submit-button">
  </form>

  <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>