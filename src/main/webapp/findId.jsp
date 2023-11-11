<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" type="text/css" href="css/findid.css">
</head>
<script type="text/javascript" src="js/findinfo.js"></script>
<body>
  <form name="idfindscreen" method = "POST">
      <div class="back-button">
          <a href="index.jsp"><image src="image/x.png"></image></a>
      </div>
      <h2 onclick="location.href='index.jsp'">TITLE </h2>
      <!-- 메인태그     -->
      <div class="container">
          <h3>회원가입한 이메일과 이름을 입력해주세요</h3>
          <!-- 이메일입력 -->
          <input type="text" id="useremail" name="member_email" onKeyup = "addHypen(this);" placeholder="이메일를 입력하세요">
          <!-- 이름입력 -->
          <input type="text" id="username" name="username" placeholder="이름을 입력하세요">

          <button type="submit" name="enter" id="login" onClick="id_search()">아이디 찾기</button>
      </div>
  </form>
      <!-- 비밀번호찾기 / 로그인하기 -->
      <div class="findlogin">
          <button class="btn_findpwd" onclick="location.href='findPw.jsp'">패스워드찾기</button>
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
