<%@page import="model.SlideshowSample"%>
<%@page import="model.SlideshowSampleLogic"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="model.UserAccount" %>
<%
UserAccount loginUser = (UserAccount)session.getAttribute("loginUser");
List<SlideshowSample> bookListSlide = (List<SlideshowSample>) request.getAttribute("bookListSlide");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>大学受験生向け書籍販売サイト「ポスタゴン」トップページ</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/slideshow.css">
<link rel="stylesheet" href="./css/info.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.5.8/swiper-bundle.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<!-- メイン -->
<form action="/posutagonbook/BookSearchServletSample" method="post">
<!-- ▼2段階プルダウンメニューの例（市を選択すると区が出てくる） -->
<div class="pulldownset">
  <!-- ========================================== -->
  <!-- (※1)▼1段階目(メイン)のプルダウンメニュー -->
  ■教科を選択： <select class="subject" name="subject">
    <option value="">選択</option>
    <option value="japanese">国語</option>
    <option value="math">数学</option>
    <option value="english">英語</option>
    <option value="science">理科</option>
    <option value="society">社会</option>
  </select>

  <!-- ================================================================ -->
  <!-- (※2)▼項目「国語」に対応する2段階目(サブ)のプルダウンメニュー -->
  <select id="japanese" class="subbox" name="japanese">
    <option value="">選択</option>
    <option value="japanese1">現代文</option>
    <option value="japanese2">古文</option>
  </select>

  <!-- ================================================================ -->
  <!-- (※3)▼項目「数学」に対応する2段階目(サブ)のプルダウンメニュー -->
  <select id="math" class="subbox" name="math">
    <option value="">選択</option>
    <option value="math1">数ⅠA</option>
    <option value="math2">数ⅡB</option>
    <option value="math3">数Ⅲ</option>
  </select>

  <!-- ================================================================ -->
  <!-- (※4)▼項目「英語」に対応する2段階目(サブ)のプルダウンメニュー -->
  <select id="english" class="subbox" name="english">
    <option value="">選択</option>
    <option value="english1">リーディング</option>
    <option value="english2">リスニング</option>
    <option value="english3">単語帳</option>
  </select>

  <!-- ================================================================ -->
  <!-- (※5)▼項目「理科」に対応する2段階目(サブ)のプルダウンメニュー -->
  <select id="science" class="subbox" name="science">
    <option value="">選択</option>
    <option value="science1">物理</option>
    <option value="science2">化学</option>
    <option value="science3">生物</option>
    <option value="science4">地学</option>
  </select>

  <!-- ================================================================ -->
  <!-- (※6)▼項目「社会」に対応する2段階目(サブ)のプルダウンメニュー -->
  <select id="society" class="subbox" name="society">
    <option value="">選択</option>
    <option value="society1">地理</option>
    <option value="society2">日本史</option>
    <option value="society3">世界史</option>
    <option value="society4">公民</option>
  </select> <label><input type="submit" value="検索" /></label>

</div>
</form>

  <!-- Swiper START -->
    <div class="swiper-container">
      <!-- メイン表示部分 -->
      <div class="swiper-wrapper">
        <!-- 各スライド -->
        <% for(SlideshowSample slide : bookListSlide) {%>
        <div class="swiper-slide">
        <img src="<%= slide.getBookImageUrl() %>"><%-- <%= slide.getBookName() %> --%>
        </div>
    <% } %>
      </div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>
    <!-- Swiper END -->
  <main>
  <h2>■ニュース</h2>
    <div class="info">
    <dl><dt>５月２１日:</dt><dd>書籍販売サイト「ポスタゴン」オープン！</dd></dl>
    <dl><dt>５月２４日:</dt><dd>参考書多数入荷しました。</dd></dl>
    <dl><dt>５月２６日:</dt><dd>ログイン画面の不具合を修正いたしました。</dd></dl>
    <dl><dt>５月２８日:</dt><dd>書籍検索機能の不具合を修正いたしました。</dd></dl>
    <dl><dt>５月３０日:</dt><dd>検索結果画面を作りたいです。</dd></dl>
    <dl><dt>６月０１日:</dt><dd>６月に入りました。これからもポスタゴンをよろしくお願いいたします。</dd></dl>
    <dl><dt>６月０３日:</dt><dd>６月５日（土）は、タイムセール！3000円以上のお買い上げで送料無料。</dd></dl>
    <dl><dt>６月０４日:</dt><dd>参考にしたWEBページは「<a href="https://www.kinokuniya.co.jp/" target="_blank">紀伊国屋書店</a>」です。</dd></dl>
    </div>
  </main>
  <!-- メイン ここまで -->
  <hr>
<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.5.8/swiper-bundle.min.js"></script>
  <script type="text/javascript" src="./js/style.js"></script>
  <script type="text/javascript" src="./js/slideshow.js"></script>
</body>
</html>