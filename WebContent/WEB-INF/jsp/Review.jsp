<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.UserAccount,model.Review,model.PostReviewLogic,model.Order_detail,java.util.List" %>
<%
	 //セッションスコープに保存されたユーザー情報を取得
	UserAccount loginUser = (UserAccount)session.getAttribute("loginUser");
	//リクエストスコープに保存された購入履歴を取得
	//List<Order_detail> orderList = (List<Order_detail>) request.getAttribute("orderList");
	/* //アプリケーションスコープに保存されたレビューリストを取得
	List<Review> reviewList = (List<Review>) application.getAttribute("reviewList"); */
	String id = (String)request.getAttribute("id");
	String bookName = (String)request.getAttribute("bookName");
	String bookText = (String)request.getAttribute("bookText");
	String bookImageUrl = (String)request.getAttribute("bookImageUrl");
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
	<style>
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
	<h2 id = "review">レビュー</h2>
	<form action="/posutagonbook/Logout" method ="get">
	 	 <input type="submit" value="ログアウト" style="position: absolute; right: 20px; top: 20px" />
	</form>

<div class="order_historiy">

        <div class="order-item">
        <div class="order-photo">
          <img src=<%= bookImageUrl %> alt="" width="200" height="200">
        </div>
        <div class="order-text">
          <h3><%= bookName%></h3>
          <form action="/posutagonbook/ReviewEnd" method="post">
          <input type = "hidden" name = "user_id" value=<%= loginUser.getUserId() %>>
          <input type = "hidden" name ="book_id" value=<%= id %>>
          <select class="reviewscore" name = "review_score" required>
            <option value="">評価</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
          <br>
          <textarea name = "review" required></textarea>
          <br>
          <input type = "hidden" name = "answered_date" >
          <input type="submit" name = "submit" value = "登録">
          </form>
        </div>
      </div>
</div>
</main>
</div>
<!-- メインここまで -->
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>