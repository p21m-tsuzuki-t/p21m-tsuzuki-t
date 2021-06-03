<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
	Cart cart=(Cart)session.getAttribute("cart");
	Book book = (Book) request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>大学受験生向け書籍販売サイト「ポスタゴン」カート</title>

	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
	<link rel="stylesheet" href="./css/slideshow.css">
	<link rel="stylesheet" href="./css/info.css">
	<link rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.5.8/swiper-bundle.min.css">

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<%if(cart == null){%>
	<p>カートの中身は空です。</p>
	<form action="/posutagonbook/" method ="get">
	<input type="submit" value="トップに戻る">
	</form>
	<%} %>

	<%if(cart != null){%>
	<table class="table table-striped mt-4">
	<tr><th>画像</th><th>商品名</th><th>価格</th></tr>

		<%
		int index = 0;
		for(Item i:cart.getList()) {
		%>
		<tr>
		<th><img width="90px" src="<%=i.getBookImageUrl() %>"></th>
		<th><%=i.getBookName() %></th>
		<td><%=String.format("%,d円",i.getPrice()) %></td>
		<td><form action="/posutagonbook/CartServlet" method="post">
		<input type="hidden" name="index" value="<%=index %>">
		<input type="submit" name="cancel" value="削除"></form></td>
		</tr>
		<%
		index++;
		}
		%>
	</table>

	<div class="alert alert-secondary float-right" role="alert">
	 	<%=String.format("合計:%,d円",cart.getTotal()) %>
	</div>

	<form action="/posutagonbook/ConfirmServlet" method="get">
		<input type="submit" name="buy" value="購入に進む">
	</form>

	<%-- <a href="/WEB-INF/jsp/purchase_confirm.jsp">購入に進む</a> --%>
	<%} %>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>