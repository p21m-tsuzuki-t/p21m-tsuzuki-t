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
	<title>大学受験生向け書籍販売サイト「ポスタゴン」会社概要</title>
	<link rel="stylesheet" href="css/styling.css">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<h1>会社概要</h1>
	<p>ようこそ、<% if(loginUser != null){ %>
	<%= loginUser.getUserId() %>
	<% }else{ %>
	  ゲスト
	<% } %>
	さん</p>
	<table class="kaisha">
	<tr>
	<th>会社名</th>
	<td>株式会社ポスタゴン</td>
	</tr>
	<tr>
	<th>本社所在地</th>
	<td>〒000-0000<br>
	○○県○○市○○区○○町0-0-0</td>
	</tr>
	<tr>
	<th>代表取締役</th>
	<td>小池 智仁</td>
	</tr>
	<tr>
	<th>従業員数</th>
	<td>5名</td>
	</tr>
	<tr>
	<th>電話</th>
	<td>000-0000-0000</td>
	</tr>
	<tr>
	<th>事業内容</th>
	<td>大学受験生向け参考書の販売</td>
	</tr>
	</table>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>