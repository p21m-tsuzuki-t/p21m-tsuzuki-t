<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.UserAccount" %>
<%
 //セッションスコープに保存されたユーザー情報を取得
UserAccount loginUser = (UserAccount)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>大学受験生向け書籍販売サイト「ポスタゴン」レビュー</title>
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
	<link rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.5.8/swiper-bundle.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<!-- メイン -->
	<main>
	<h2>登録が完了しました。</h2>
	</main>
	<!-- メインここまで -->
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
	<script>
	'use strict';
	if (window.confirm('これで登録しますか？')){
	} else {
		history.back();
		window.location.href = 'http://localhost:8080/posutagonbook/Review?';
	}
	</script>
</body>
</html>