<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Book"%>
<%
List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
<!-- <link rel="stylesheet" href="./css/searchresult.css"> -->
</head>
<body>
  <h1>書籍一覧</h1>
  <form action="/posutagonbook/DetailServlet" method="get">
    <%
    for (Book book : bookList) {
    %>
    <div class="searchresult_photo">
      <img src="<%=book.getImage()%>" alt="" width="200" height="200">
    </div>
    <p>書籍名：<%=book.getBookName()%></p><br>
    <div class="searchresult_text">
      <p>商品説明：<%=book.getText()%></p><br>
    </div>
    <p>価格：\<%=book.getPrice()%></p><br>
    <input type="submit" value="詳細">
    <input type="hidden" name="bookId" value="<%=book.getPublisher()%>"><br>
    <input type="hidden" name="bookId" value="<%=book.getBookId()%>">
    <input type="hidden" name="bookId" value="<%=book.getBookId()%>">
    <input type="hidden" name="bookId" value="<%=book.getBookId()%>"><br>

    <%
    }
    %>
  </form>
</body>
</html>