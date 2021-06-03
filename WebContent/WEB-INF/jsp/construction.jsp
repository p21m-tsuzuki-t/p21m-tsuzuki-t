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
<title>大学受験生向け書籍販売サイト「ポスタゴン」工事中</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/slideshow.css">
<link rel="stylesheet" href="./css/info.css">
<link rel="stylesheet" href="./css/maintenance.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
  <div class="wrap">
    <h1>メンテナンスのお知らせ</h1>


    <main>
    <img src="./images/job_kouji_ojigi.png" alt="Ojigi" class="image-vw">
      <p>現在、メンテナンス中です。お客様にはご不便をおかけいたしまして、誠に申し訳ございませんが、ご了承くださいますようお願い申し上げます。</p>

    </main>
  </div>
  <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>