<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 注文完了画面 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>大学受験生向け書籍販売サイト「ポスタゴン」注文完了</title>
	<link rel="stylesheet" href="./css/form_button.css">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	<%-- 以下の文を、画面中央へ。
	画面下部の右隅に、「ホームへ戻る」ボタン配置 --%>
  	<p style="text-align:center;">注文が完了しました。<br></p>
  	<p style="text-align:center;">ご注文ありがとうございました！</p>

  	<form action="/posutagonbook/" method="get">
  		<p style="text-align:left;">
    	<input type="submit"  value="トップへ" class="submit-button">
  		</p>
  	</form>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>