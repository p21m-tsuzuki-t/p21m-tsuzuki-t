<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>大学受験生向け書籍販売サイトログイン</title>
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<h1>ログイン画面</h1>
	<form action="/posutagonbook/LoginServlet" method="post">
	ユーザーID<input type="text" name="user_id"><br>
	パスワード<input type="password" name="pass"><br>
	<input type="submit" value="ログイン">
	</form>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>