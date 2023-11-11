<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1.0" >  <!-- 반응형 웹에서 사용하는 meta tag -->
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"> <!-- 참조  -->
    <!-- 1.카카오 SDK로드 -->
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
    <div class="back-button">
        <a href="index.jsp"><image src="image/x.png"></image></a>
    </div>
    <h2>BikeRoad </h2>

    <div class="container">
        <h3>LOGIN</h3>

        <form method = "post" action="loginAction.jsp">
        <input type="text" id="userid" name="userID" placeholder="아이디를 입력하세요">
        <input type="password" id="password" name="userPassword" placeholder="비밀번호를 입력하세요">
        <button type="submit" name="login" id="login">로그인</button>
        </form>

        <a href="join.jsp">회원가입</a>
    </div>
    <!-- 아이디 / 비번 찾기 -->
    <div class="findlogin">
        <button class="btn_findid" onclick="location.href='findId.jsp'">아이디찾기</button>
        <button class="btn_findpwd" onclick="location.href='findPw.jsp'">패스워드찾기</button>
    </div>
    <!-- 카카오톡 로그인하기 버튼 -->


            <div class="fastlogin">
                <a href="javascript:kakaoLogin()" id="btn-kakao-login"><button class="kakaologin">
                <img src=image/kakaologo.png>
                <p>카카오톡으로 로그인하기</p>
                </button></a>
            </div>

            <div>
                <a href="javascript:kakaoLogout()">카카오톡 로그아웃</a>
            </div>

            <script type="text/javascript">
                Kakao.init('73e5ce52a103b52f8c4d4e9807b4e25c');
                function kakaoLogin() {
                    Kakao.Auth.login({
                        success: function (response) {
                            Kakao.API.request({
                                url: '/v2/user/me',
                                success: function (response) {
                                    alert(JSON.stringify(response))
                                        var k_id = response.id;
                                        var k_email = response.kakao_account.email;
                                        window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/kakaoLoginAction.jsp?kakaoid="+k_id+"&kakaoemail="+k_email);

                                },
                                fail: function (error) {
                                    alert(JSON.stringify(error))
                                },
                            })
                        },
                        fail: function (error) {
                            alert(JSON.stringify(error))
                        },
                    })
                }
            </script>
            <script type="text/javascript">
                //5.로그아웃(카카오서버에 접속하는 엑세스 토큰을 만료, 사용자 어플리케이션의 로그아웃은 따로 진행
                function kakaoLogout() {
                    if (!Kakao.Auth.getAccessToken()) {
                        alert('Not logged in.');
                        return;
                    }
                    Kakao.Auth.logout(function() {
                        alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
                    });
                }
            </script>
        </div> 
        <div class="col-lg-4"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>

<!--
//카카오로그아웃
<div>
<a href="javascript:kakaoLogout()"><img src="/img/kakao_login_large_narrow.png" style="width: 200px"></a>
</div>
<li onclick="kakaoLogout();">
<a href="javascript:void(0)">
<span>카카오 로그아웃</span>
</a>
</li>

<script type="text/javascript">
Kakao.init('73e5ce52a103b52f8c4d4e9807b4e25c');
function kakaoLogout()
.then(function(response){
console.log(Kakao.Auth.getAccessToken()); // null
})
.catch(function(error) {
console.log('Not logged in.');
});

</script>


function kakaoLogout() {
if (Kakao.Auth.getAccessToken()) {
Kakao.API.request({
url: '/v1/user/unlink',
success: function (response) {
console.log(response)
},
fail: function (error) {
console.log(error)
},
})
Kakao.Auth.setAccessToken(undefined)
}
}
</script>
-->