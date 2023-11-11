<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<script type="text/javascript">
    function CheckForm(){
        if(document.LoginForm.mID.value == ""){
            alert("아이디 입력해라");
            document.LoginForm.mID.focus( );
            return false;
        }
        alert("정상적으로 입력됨");
    }
    function AlertTest(){
        alert("문자 메세지!!");
        return false;
    }
    function IdLength(){
        if(document.LoginForm.mID.value.length < 4 || document.MyForm.M_ID.value.length > 16){
            alert("아이디를 4-16자 이내로 입력하세요");
            document.LoginForm.mID.focus( );
            return false;
        }
        for(i=0; i<document.LoginForm.mID.value.length; i++){
            var ch = document.LoginForm.mID.value.charAt(i);
            if((ch<'a' || ch>'z') && (ch<'0' || ch>'9')){
                alert("영문소문자와 숫자만 입력하세요! 기호는 ^만 가능");
                document.LoginForm.mID.focus( );
                return false;
            }
        }
        alert("정상적으로 입력됨");
    }
</script>
<body>
<%

%>
로그인<br> <br>
<hr>
<form action="LoginOK1.jsp" method="post" name="LoginForm">
    ID : <input type="text" name="userID" value="uid"> <br>
    PASSWORD : <input type="password" name="userPassword" value="1234"> <br> <br>
    <input type="submit"  value="로그인"  > &nbsp; <input type="reset"  value="초기화"><br>
    <!-- 안되면 주석처리하고 다음거하기 -->
</form> <br>
<a id="kakao-login-btn"></a>
<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>
<div id="result"></div>
<script type="text/javascript">
    function unlinkApp() {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function(res) {
                alert('success: ' + JSON.stringify(res))
            },
            fail: function(err) {
                alert('fail: ' + JSON.stringify(err))
            },
        })
    }
</script>

<script type="text/javascript">
    Kakao.init('73e5ce52a103b52f8c4d4e9807b4e25c');
    console.log(Kakao.isInitialized());

    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(result) {
                    $('#result').append(result);
                    id = result.id
                    connected_at = result.connected_at
                    kakao_account = result.kakao_account
                    $('#result').append(kakao_account);
                    resultdiv="<h2>로그인 성공 !!"
                    resultdiv += '<h4>id: '+id+'<h4>'
                    resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
                    email ="";
                    gender = "";
                    if(typeof kakao_account != 'undefined'){
                        email = kakao_account.email;
                        gender = kakao_account.gender;
                    }
                    resultdiv += '<h4>email: '+email+'<h4>'
                    resultdiv += '<h4>gender: '+gender+'<h4>'
                    $('#result').append(resultdiv);

                },
                fail: function(error) {
                    alert(
                        'login success, but failed to request user information: ' +
                        JSON.stringify(error)
                    )
                },
            })
        },
        fail: function(err) {
            alert('failed to login: ' + JSON.stringify(err))
        },
    })
</script>

</body>
</html>