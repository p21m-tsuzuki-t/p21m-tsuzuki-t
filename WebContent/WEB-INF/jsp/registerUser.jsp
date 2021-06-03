<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>大学受験生向け書籍販売サイト「ポスタゴン」ユーザー登録</title>
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
</head>

<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<h1>ユーザー登録</h1>
<form action="/posutagonbook/RegisterServlet" method="post">
ユーザーID：<input type="text" name="user_id" pattern="\w{7}" title ="半角英数とアンダースコアのみで7文字入力してください" required><br>
姓：<input type="text" name="f_name" required><br>
名：<input type="text" name="l_name" required><br>
住所：<input type="text" name="address" required><br>
電話番号：<input type="tel" name="tel" size="17" pattern="\d{1,5}-\d{1,4}-\d{4,5}"
 placeholder="00-0000-0000" title="電話番号は、市外局番からハイフン（-）を入れて記入してください。" required><br>
メールアドレス：<input type="email" name="mail" required><br>
パスワード：<input type="password" name="pass" required><br>
<input type="submit" value="アカウント作成">
</form>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>