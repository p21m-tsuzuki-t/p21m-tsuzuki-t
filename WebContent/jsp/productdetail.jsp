<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>商品詳細</title>
  <link rel="stylesheet" type="text/css" href="stylesheet.css">

</head>
  <body>
    <h1>商品詳細</h1>

<?php
session_start();
  $id=$_POST['id'];




    $hostname = "localhost";    //ホスト名
    $userid = "iimori";    //データベースユーザ名
    $passwd = "A8h3avau";    //接続パスワード
    $dbname = "ecdatabase";    //データベース名
    $con=mysqli_connect($hostname,$userid,$passwd,$dbname);   //db接続に必要な情報を変数に入れる

            // 接続状況をチェックします
    if (mysqli_connect_errno()) {
        die("データベースに接続できません:" . mysqli_connect_error() . "\n");
    }

    $error="";
    $con->set_charset('utf8');

      /* プリペアドステートメントを作成します */
      if ($stmt = mysqli_prepare($con, "SELECT productName,productImagePath,introduce,price FROM product WHERE id = ?")) {

          /* マーカにパラメータをバインドします */
          mysqli_stmt_bind_param($stmt, "s", $id);

          /* クエリを実行します */
          mysqli_stmt_execute($stmt);

          /* 結果変数をバインドします */
          mysqli_stmt_bind_result($stmt, $productName,$productImagePath,$introduce,$price);


          /* 値を取得します */
          mysqli_stmt_fetch($stmt);

          /* ステートメントを閉じます */
          mysqli_stmt_close($stmt);
      }

    // 接続を閉じます
    mysqli_close($con);

 ?>

 <script>
 /**
  * 確認ダイアログの返り値によりフォーム送信
 */
 function logoutChk () {
     /* 確認ダイアログ表示 */
     var flag = confirm ( "本当にログアウトしますか？\n\n");
     /* send_flg が TRUEなら送信、FALSEなら送信しない */
     return flag;
 }

 </script>
<!-- <!– 左サイドメニュー –> -->
<div class="leftmenu">
<div class="subinfo"> <?php echo "ようこそ、".$_SESSION['name']."さん！"?> </div>

<!-- <!– メニュー –> -->
<div class="subinfo">
  <form  action="cart.php" method="post">
    <input type="submit" name="toCart" value="カートの中身を確認する">

  </form>
  <form  action="login.php" method="post">
    <input type="submit" name="logout" value="ログアウト">
  </form>
</div>

</div>


<div class="center">
  <img src="<?=$productImagePath; ?>"><br>
  <p><?=$productName?></p>
  <p><?=$introduce?></p>
  <p>￥<?=$price?></p>


<form method='post' action='product_list.php'>
<select name='quantity'>
  <?php for($i=1; $i<=9; $i++){
    echo "<option value=".$i.">".$i."</option>";
  }?>


</select>個
<br>
  <input type='submit' name= "cartIn" value='カートに入れる' />
  <input type="hidden" name="id" value="<?=$id?>">
</form>
<br>
<form  action="product_list.php" method="post">
  <input type='submit' name="cancel" value='戻る' />
</form>
</div>
</body>
</html>
