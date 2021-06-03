<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.UserAccount,model.Order_detail,java.util.List" %>
<%
//セッションスコープに保存されたユーザー情報を取得
UserAccount loginUser = (UserAccount)session.getAttribute("loginUser");
//リクエストスコープに保存された購入履歴を取得
List<Order_detail> orderList = (List<Order_detail>) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>大学受験生向け書籍販売サイト「ポスタゴン」マイページ</title>
  <link rel="stylesheet" href="./css/style.css">
  <link rel="stylesheet" href="./css/style2.css">
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.5.8/swiper-bundle.min.css">
  <style>
  /*ユーザー情報*/

  .info {
    border-collapse: collapse;
    margin-left: auto;
    margin-right: auto;
  }

  .info td, .info th {
    border: 1px #808080 solid;
   }


  .info th {
    background-color: #dde2ea;
    width: 150px;
    color: #3f5170;
    vertical-align: top;
  }

  .info td {
    width: 150px;
    text-align: center;
    vertical-align: top;
  }



  /* 購入履歴のスタイル*/
  .order-item {
    display: flex;
    border-bottom: 1px dashed #bec2c7;
    padding: 20px 8px;

  }
  .order-photo {
    margin-right: 16px;
    flex: 1 1 auto;
  }
  .order-text {
      flex: 100 100 360px;
  }

  </style>
</head>
<body>
<div class = "wrapper">
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<!-- メイン -->
<main>
<h2>マイページ</h2>
<form action="/posutagonbook/Logout" method ="get">
  <input type="submit" value="ログアウト" style="position: absolute; right: 20px; top: 20px" />
  </form>
<h3 id = "userinfo">■登録情報</h3>
<table class="info">
    <tr>
      <th>ID</th>
      <td><%=loginUser.getUserId()%></td>
    </tr>
    <tr>
      <th>姓</th>
      <td><%=loginUser.getlName()%></td>
    </tr>
    <tr>
      <th>名</th>
      <td><%=loginUser.getfName()%></td>
    </tr>
    <tr>
      <th>パスワード</th>
      <td><%=loginUser.getPass()%></td>
    </tr>
    <tr>
      <th>住所</th>
      <td><%=loginUser.getAddress()%></td>
    </tr>
    <tr>
      <th>電話番号</th>
      <td><%=loginUser.getTel()%></td>
    </tr>
    <tr>
      <th>メールアドレス</th>
      <td><%=loginUser.getMail()%></td>
    </tr>
    </table>

<h3>■購入履歴</h3>
<div class="order_historiy">
        <%
        for(Order_detail order : orderList) {
        %>

        <div class="order-item">
        <div class="order-photo">
          <img src="<%=order.getBookimageurl()%>" alt="" width="200" height="200">
        </div>
        <div class="order-text">
          <h3><%=order.getBookname()%></h3>
          <p><%=order.getBooktext()%></p><br>
          <form action="/posutagonbook/ReviewServlet" method ="post">
          <input type = "hidden" name ="id" value="<%=order.getBook_id()%>">
          <input type = "hidden" name ="bookName" value="<%=order.getBookname()%>">
          <input type = "hidden" name ="bookText" value="<%=order.getBooktext()%>">
          <input type = "hidden" name ="bookImageUrl" value="<%=order.getBookimageurl()%>">
          <input type="submit" value="レビューを書く">
          </form>
        </div>
      </div>
       <% } %>
</div>
</main>
</div>
<!-- メインここまで -->
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>