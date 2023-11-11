<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    String memberId = (String)session.getAttribute("ID");
    boolean login = memberId == null ? false : true;
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사고다발구역</title>
    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/locker.css">
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

<div id="map" style="width:100%;height:100vh;"></div>
<p>
    <button onclick="setCenter()">망원역 1번 출구 앞</button>
</p>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=73e5ce52a103b52f8c4d4e9807b4e25c"></script>
<script>
    var xhr = new XMLHttpRequest();
    var url = 'http://openapi.seoul.go.kr:8088/676b5278546b6864363158524e4c71/json/bikeList/1/5/';
    xhr.open('GET', url);

    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.541, 126.986),
        level: 8
    };
    var map = new kakao.maps.Map(container, options);


    xhr.onreadystatechange = function () {
        if (this.readyState == xhr.DONE) { // <== 정상적으로 준비되었을때
            if (xhr.status == 200 || xhr.status == 201) {
                var ch = JSON.parse(this.response);

                var positions = [
                    {
                        content: '<div>'+ch.rentBikeStatus.row[0].stationName+'</div>',
                        latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[0].stationLatitude, ch.rentBikeStatus.row[0].stationLongitude)
                    },
                    {
                        content: '<div>'+ch.rentBikeStatus.row[1].stationName+'</div>',
                        latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[1].stationLatitude, ch.rentBikeStatus.row[1].stationLongitude)
                    },
                    {
                        content: '<div>'+ch.rentBikeStatus.row[2].stationName+'</div>',
                        latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[2].stationLatitude, ch.rentBikeStatus.row[2].stationLongitude)
                    },
                    {
                        content: '<div>'+ch.rentBikeStatus.row[3].stationName+'</div>',
                        latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[3].stationLatitude, ch.rentBikeStatus.row[3].stationLongitude)
                    }
                ];

                for (var i=0; i<positions.length; i++) {

                    var markers = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng // 마커의 위치
                    });

                    var infowindow = new kakao.maps.InfoWindow({
                        content: positions[i].content
                    });

                    kakao.maps.event.addListener(markers, 'mouseover', makeOverListener(map, markers, infowindow));
                    kakao.maps.event.addListener(markers, 'mouseout', makeOutListener(infowindow));
                }

                function makeOverListener(map, markers, infowindow) {
                    return function () {
                        infowindow.open(map, markers);
                    };
                }

                function makeOutListener(infowindow) {
                    return function () {
                        infowindow.close();
                    };
                }
            }
        }
    };
    xhr.send('');
</script>
</body>
</html>