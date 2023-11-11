<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String memberId = (String)session.getAttribute("ID");
    boolean login = memberId == null ? false : true;
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자전거 지도</title>
    <!-- 2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
    <link rel="stylesheet" type="text/css" href="css/locker.css">
</head>
<body>

<div class="header">
    <div class="upper">
        <div class="logo" onclick="location.href='index.jsp'">로고화면</div>

        <!-- 로그인 / 로그아웃 -->
        <div class="log">
            <%
                if (login){
            %>
            <br>
            <a href="logout.jsp" class="logincheck">로그아웃&nbsp;&nbsp;/&nbsp;&nbsp;</a>
            <a href="myfavorite.html" class="myfavorite">아이디 "<%=memberId%>"로 로그인한 상태</a>
            <%
            } else {
            %>
            <a href="/login.jsp" class="logincheck">로그인&nbsp;&nbsp;/&nbsp;&nbsp;</a>
            <a href="myfavorite.html" class="myfavorite">로그인하지 않은 상태</a>
            <%
                }
            %>
        </div>
    </div>
</div>

<script src="js/locker.js"></script>
<hr/>


<div id="map" style="width:100%;height:100vh;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4496655315afe9a889abb090aaeb7014"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.55564880, 126.91062927), //중심좌표 -> 망원역 1번출구앞
        level: 3
    };

    var map = new kakao.maps.Map(container, options);

    map.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);
</script>

</body>
</html>
