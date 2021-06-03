<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.UserAccount" %>
<%
UserAccount loginUser = (UserAccount)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<!-- ヘッダー -->
<header class="header">
  <h1>
    <a href="/posutagonbook/"><img src="./images/logo.png"
      alt="PostagonBook">大学受験生向け書籍販売サイト「ポスタゴン」</a>
  </h1>
	<p><b>　　ようこそ</b>、<% if(loginUser != null){ %>
	<%= loginUser.getUserId() %>
	<% }else{ %>
		ゲスト
	<% } %>
	さん</p>
<% if(loginUser == null){ %>
	<form action="/posutagonbook/LoginServlet" method ="get">
	<input type="submit" value="ログイン" style="position: absolute; right: 20px; top: 20px" />
	</form>
<% } else {%>
	<form action="/posutagonbook/Logout" method ="get">
	<input type="submit" value="ログアウト" style="position: absolute; right: 20px; top: 20px" />
	</form>
<% } %>
<form action="/posutagonbook/CartJumpServlet" method ="get">
<input type="image" src="./images/shopping_cart.png" style="position: absolute; right: 20px; top: 190px" />
</form>
  <!--    <a href="">ログイン</a></ul> -->
  <nav class="nav">
    <ul>
      <li><a href="/posutagonbook/">ホーム</a></li>
      <li><a href="/posutagonbook/">書籍</a></li>
      <li><a href="/posutagonbook/MyPage">マイページ</a></li>
      <li><a href="/posutagonbook/">お問い合わせ</a></li>
    </ul>
  </nav>
</header>
<hr>
<!-- ヘッダー ここまで -->
</body>
</html>