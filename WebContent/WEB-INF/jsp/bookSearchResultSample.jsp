<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.BookSample" %>
<%
	List<BookSample> bookList = (List<BookSample>)request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>大学受験生向け書籍販売サイト「ポスタゴン」検索結果</title>
	<link rel="stylesheet" href="./css/searchresult.css">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<h1>■検索結果一覧 (<%= bookList.size() %>件)</h1>
	<div class="order_historiy">
        <%
        for(BookSample book : bookList) {
        %>
        <div class="book-item">
        <div class="book-photo">
          <img src="<%=book.getImage()%>" alt="書籍画像" width="200" height="200">
        </div>
        <div class="book-price">
          <h2>書籍名：<%=book.getBookName()%></h2>
          <h2><%=book.getPrice()%>円</h2>
          <form action="/posutagonbook/DetailServlet" method ="post">
          <input type = "hidden" name ="bookId" value="<%=book.getBookId()%>">
          <input type="submit" value="詳細ページへ">
          </form>
        </div>
      </div>
       <% } %>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>