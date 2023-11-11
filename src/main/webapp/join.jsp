<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="css/join.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <h2>CREATE ACCOUNT</h2>

    <form method = "post" action="joinAction.jsp" name="joinForm">
    <div class="container">
        <div class="square">
            <div class="id">

                <h3>아이디</h3>
                <!-- <p>영소문자</p> -->
                <input type="text" id="userid" name="userID" placeholder="아이디">
            </div>

            <br>

            <div class="pw">
                <h3>비밀번호</h3>
                <input type="password" id="password" name="userPassword" placeholder="비밀번호">
            </div>
            <br>

            <div class="confirmpw">
                <h3>비밀번호확인</h3>
                <input type="password" id="confirmpassword" name="userVerifyPassword" placeholder="비밀번호확인">
            </div>
            <br>

            <div class="email">
                <h3>이메일</h3>
                <input type="text" id="useremail" name="userEmail" placeholder="이메일">

            </div>
        </div>
    </div>
    <div class="check-menu-box">
        <div class="checkbox-container">
            <input type="checkbox" id="checkbox1" name="checkAll" />
            <label for="checkbox1">약관에 모두 동의</label>
        </div>
        <div class="checkbox-container">
            <input type="checkbox" id="checkbox2" name="checkOne" />
            <label for="checkbox2">(필수) 만 14세 이상입니다</label>
        </div>
        <div class="checkbox-container">
            <input type="checkbox" id="checkbox3" name="checkOne" />
            <label for="checkbox3">(필수) 서비스 이용약관에 동의</label>
        </div>
        <div class="checkbox-container">
            <input type="checkbox" id="checkbox4" name="checkOne" />
            <label for="checkbox4">(필수) 개인정보 수집이용에 동의</label>
        </div>
        <div class="checkbox-container">
            <input type="checkbox" id="checkbox5" name="checkOne" />
            <label for="checkbox5">(선택) 광고 수신 및 마케팅 이용에 동의</label>
        </div>
    </div>
    <script src="js/join.js"></script>

    <div class="entrybutton">
        <a href="login.jsp">돌아가기</a>
        <button class ="btn_join">회원가입</button>
    </div>
    </form>
</body>
</html>