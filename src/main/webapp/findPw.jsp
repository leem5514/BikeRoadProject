<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 찾기</title>
  <link rel="stylesheet" type="text/css" href="css/findpwd.css">
</head>
<script type="text/javascript" src="js/findinfo.js"></script>
<body>
  <div class="back-button">
    <a href="index.jsp"><image src="image/x.png"></image></a>
  </div>
<h2 onclick="location.href='index.jsp'">TITLE </h2>
  <!-- 메인태그     -->
  <form name="pwfindscreen" method = "POST">

    <div class="container">
      <h3>회원가입 한 ID와 이름을 입력해주세요</h3>
      <!--ID입력 -->
      <input type="text" id="userid" name="member_id" placeholder="아이디를 입력하세요">
      <!-- 이름입력 -->
      <input type="text" onKeyup = "addHypen(this);" id="username" name="member_email" placeholder="이메일을 입력하세요">

      <button type="submit" name="enter" id="find_pwd" onClick="pw_search()">패스워드 찾기</button>
    </div>
  </form>
    <!-- 비밀번호찾기 / 로그인하기 -->
    <div class="findlogin">
      <button class="btn_findid" onclick="location.href='findId.jsp'">아이디 찾기</button>
      <button class="btn_login" onclick="location.href='login.jsp'">로그인하기</button>
    </div>
    <!-- 최 하단부 -->
    <div class="bottom">
      <div class="bottom_upper">
        <a href="policy.jsp">정책</a>
        <a href="reference.jsp">참고</a>
        <a href="update.jsp">공지사항</a>
        <a href="#">운영정책</a>
      </div>
      <div class="bottom_down">
        <span>ⓒ2023 DAELIMUNIVERSITY 5 COMPANY. ALL RIGHTS RESERVED.</span>
      </div>
    </div>
</body>
</html>
