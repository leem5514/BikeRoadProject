<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-06-07
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
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
    <title>자전거 보관소 지도</title>
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
<div class="dropdown">
    <button class="dropbtn">
        <span class="dropbtn_content">자전거 보관소 찾기</span>
        <span class="dropbtn_click" style=" float:right;" onclick="dropdown()">▼</span>
    </button>
    <div class="dropdown-content">
        <div class="point" onclick="showMenu(this.innerText)"><button onclick="setStation1()">망원역 1번 출구 앞</button></div>
        <div class="point" onclick="showMenu(this.innerText)"><button onclick="setStation2()">망원역 2번 출구 앞</button></div>
        <div class="point" onclick="showMenu(this.innerText)"><button onclick="setStation3()">합정역 1번 출구 앞</button></div>
        <div class="point" onclick="showMenu(this.innerText)"><button onclick="setStation4()">망원역 5번 출구 앞</button></div>
        <div class="point" onclick="showMenu(this.innerText)"><button onclick="setStation5()">망원역 7번 출구 앞</button></div>
    </div>
</div>

<button onclick="window.location.reload()">새로고침</button>

<script src="js/locker.js"></script>
<hr/>


<div id="map" style="width:100%;height:100vh;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4496655315afe9a889abb090aaeb7014"></script>
<script>
  var xhr = new XMLHttpRequest();
  var url = 'http://openapi.seoul.go.kr:8088/676b5278546b6864363158524e4c71/json/bikeList/1/5/20230525';
  xhr.open('GET', url);

  var container = document.getElementById('map');
  var options = {
    center: new kakao.maps.LatLng(37.55564880, 126.91062927), //중심좌표 -> 망원역 1번출구앞
    level: 3
  };

  var map = new kakao.maps.Map(container, options);

  var moveLatLon1 = new kakao.maps.LatLng(37.55564880, 126.91062927);
  var moveLatLon2 = new kakao.maps.LatLng(37.55495071, 126.91083527);
  var moveLatLon3 = new kakao.maps.LatLng(37.55062866, 126.91498566);
  var moveLatLon4 = new kakao.maps.LatLng(37.55000687, 126.91482544);
  var moveLatLon5 = new kakao.maps.LatLng(37.54864502, 126.91282654);

  function setStation1() {
      map.setCenter(moveLatLon1);
  }
  function setStation2() {
      map.setCenter(moveLatLon2);
  }
  function setStation3() {
      map.setCenter(moveLatLon3);
  }
  function setStation4() {
      map.setCenter(moveLatLon4);
  }
  function setStation5() {
      map.setCenter(moveLatLon5);
  }

  xhr.onreadystatechange = function () {
    if (this.readyState == xhr.DONE) { // <== 정상적으로 준비되었을때
      if (xhr.status == 200 || xhr.status == 201) {
        var ch = JSON.parse(this.response);

        var positions = [
          {
            content: '<div>'+ch.rentBikeStatus.row[0].stationName+' <br>거치율: '+ch.rentBikeStatus.row[0].shared+'</div>',
            latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[0].stationLatitude, ch.rentBikeStatus.row[0].stationLongitude)
          },
          {
            content: '<div>'+ch.rentBikeStatus.row[1].stationName+' <br>거치율: '+ch.rentBikeStatus.row[1].shared+'</div>',
            latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[1].stationLatitude, ch.rentBikeStatus.row[1].stationLongitude)
          },
          {
            content: '<div>'+ch.rentBikeStatus.row[2].stationName+' <br>거치율: '+ch.rentBikeStatus.row[2].shared+'</div>',
            latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[2].stationLatitude, ch.rentBikeStatus.row[2].stationLongitude)
          },
          {
            content: '<div>'+ch.rentBikeStatus.row[3].stationName+' <br>거치율: '+ch.rentBikeStatus.row[3].shared+'</div>',
            latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[3].stationLatitude, ch.rentBikeStatus.row[3].stationLongitude)
          },
          {
            content: '<div>'+ch.rentBikeStatus.row[4].stationName+' <br>거치율: '+ch.rentBikeStatus.row[4].shared+'</div>',
            latlng: new kakao.maps.LatLng(ch.rentBikeStatus.row[4].stationLatitude, ch.rentBikeStatus.row[4].stationLongitude)
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
