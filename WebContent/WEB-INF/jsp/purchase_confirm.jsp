<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.time.LocalDateTime" %>
<%@ page import="model.UserAccount" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Item" %>
<%@ page import="java.time.format.*" %>
<%
UserAccount loginUser = (UserAccount)session.getAttribute("loginUser");
Cart cart=(Cart)session.getAttribute("cart");
%>
<%
       DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy/MM/dd");
       LocalDateTime order_date = LocalDateTime.now(); //現在時刻から7日後
       LocalDateTime deliverd_date = order_date.plusDays(7);
       String str = deliverd_date.format(f);
%>
<%
int sum = 0;
%>
<%-- 購入確認画面 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>大学受験生向け書籍販売サイト「ポスタゴン」購入確認</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/slideshow.css">
<link rel="stylesheet" href="./css/info.css">
<link rel="stylesheet" href="./css/styling.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.5.8/swiper-bundle.min.css">
  <link rel="stylesheet" href="./css/searchresult.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>

  <%-- 「購入確認」以下の文字を真ん中に配置
注文者詳細（ユーザー名と住所）とお届け予定日と支払方法と注文内容を順に表示し、
画面下部に「カートへ戻る」と「注文確定へ」のクリック表示 --%>

<!--     <h1>購入確認</h1> -->
    <h2>ご注文内容詳細</h2>

    <form action="/posutagonbook/BuyItemServlet" method="post">
    <h3>顧客情報</h3>
      <p>
        ご注文者:<%=loginUser.getfName() + loginUser.getlName()%><br>
        メールアドレス：<%=loginUser.getMail()%><br>
        お届け先住所：<%=loginUser.getAddress()%><br>
        <p>お届け予定日:<%= str %></p>
          <p>お支払方法を選択： <select class="subject" name="pay">
    <option value="">代金引換</option></select></p><br>


      <%for (Item item : cart.getList()) {%>
            <%-- セッションスコープ内の商品情報表示 （for文でセッションスコープ内の商品を全て表示できるよう設定 --%>
<div class="book-item">
        <div class="book-photo">
            <p><img src="<%=item.getBookImageUrl()%>"></p></div>
            <p>書籍名：<%=item.getBookName()%></p>
            <div class="book-price"><p>価格：\<%=item.getPrice()%></p></div>
            <input type = "hidden" name="bookId" value="<%=item.getBookId()%>">
            <input type = "hidden" name="bookName" value="<%=item.getBookName()%>">
            <input type = "hidden" name="userId" value="<%=loginUser.getUserId()%>">
            <input type="hidden" name="userName" value="<%=loginUser.getfName() + loginUser.getlName()%>">
            <input type="hidden" name="address" value="<%=loginUser.getAddress()%>">
            <input type="hidden" name="image" value="<%=item.getBookImageUrl()%>">
            <input type="hidden" name="text" value="<%=item.getText()%>">
            <input type="hidden" name="quantity" value="<%=item.getQuantity()%>">
            <input type="hidden" name="price" value="<%=item.getPrice()%>">
            <input type="hidden" name="order_date" value="<%= order_date %>">
            <input type="hidden" name="deliverd_date" value="<%= str %>">
</div>
            <%}%>
<!--       </table> -->
<div class="alert alert-secondary float-right" role="alert" >
              <p><%=String.format("合計:%,d円", cart.getTotal())%></p><br>
            </div> <%--= sum --%>
      <p style="text-align: left;">
        <a href="/posutagonbook/">戻る</a>
      </p>
      <p style="text-align: center;"></p>
      <input type="submit" value="注文確定へ">
    </form>
    <%-- formに変更 送信ボタン method=post --%>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>