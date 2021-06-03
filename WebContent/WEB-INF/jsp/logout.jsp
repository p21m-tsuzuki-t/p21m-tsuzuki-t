<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>大学受験生向け書籍販売サイト「ポスタゴン」ログアウト</title>
	<link rel="stylesheet" href="./css/form_button.css">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<h1>ログアウト画面</h1>
	<p>ログアウトしました</p>

	<form action="/posutagonbook/" method="get">
	    <input type="submit" value="トップへ" class="submit-button">
	</form>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>