<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Book" %>
<%@ page import="model.Review" %>
<%@ page import="java.util.List" %>
<%--@ page import="商品一覧ページ" --%>

<%
	Book book = (Book) request.getAttribute("book");
	List<Review> reviewList =(List<Review>) request.getAttribute("reviewList");

	int sum = 0;
	int count = 0;
	double average = 0;
	if(reviewList == null ||reviewList.isEmpty()){
		reviewList = new ArrayList<Review>();
	}else{

		for(Review review : reviewList){
			sum += review.getReviewScore();
			count++;
		}

	average = sum / count;
	}
%>

<% Review review1 = (Review) request.getAttribute("review1"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>大学受験生向け書籍販売サイト　書籍名：<%= book.getBookName() %></title>

	<style>
	.detail { line-height: 50px }
	</style>

	<link rel="stylesheet" href="../../css/style.css">
	<link rel="stylesheet" href="../../css/style2.css">
	<link rel="stylesheet" href="../../css/slideshow.css">
	<link rel="stylesheet" href="../../css/info.css">
	<link rel="stylesheet" href="./css/form_button.css">
	<link rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.5.8/swiper-bundle.min.css">

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<h1><%= book.getBookName() %></h1>
	<img width="300px" src="<%= book.getImage() %>">
	<p class = detail>出版社：<%= book.getPublisher() %><br>
	価格：<%= book.getPrice() %>円<br>

	評価：
	<% if(reviewList.size() == 0){ %>
	まだありません。
	<% }else{ %>
	<% for(int i=0; i<average; i++){ %>
	★
	<% } %><%= average --%>
	<% } %>
	<br>
	商品説明：<%= book.getText() %></p><br>

	<form action="/posutagonbook/CartServlet" method="post">
	<%--input type="number" name="number"> --%>
	<input type="hidden" name="bookId" value="<%=book.getBookId() %>">
	<input type="hidden" name="image" value="<%=book.getImage() %>">
	<input type="hidden" name="bookName" value="<%=book.getBookName() %>">
	<input type="hidden" name="price" value="<%=book.getPrice() %>">


	<input type="submit" name="cart" value="カートに入れる">
	</form>

	<!-- <a href="bookSearchResult.jsp">戻る</a> -->
	<form action="/posutagonbook/" method="get">
	    <input type="submit"  value="戻る" class="submit-button">
	</form>
	<h3>レビュー</h3>
	<% if(reviewList.size() == 0){ %>
		レビューはまだありません。
	<% }else{ %>
	 <% for(Review review : reviewList){ %>
		<%= review.getUserId() %>:評価<%= review.getReviewScore() %>　　<%= review.getAnsweredDate() %><br>
	<%= review.getReview() %>
	<br>
	<% } %>
	<% } %>

	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
