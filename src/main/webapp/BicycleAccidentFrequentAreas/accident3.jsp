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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8587d329b19927c1703bd2588c2e10c"></script>

<p>
    <button onclick="setCenter()">망원역 1번 출구 앞</button>
</p>

<script>
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(37.541, 126.986), //지도의 중심좌표.
        level: 10 //지도의 레벨(확대, 축소 정도)
    };
    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    const index=['710','560','260','230','350','470','200','215','530','740'];  //5: '680','305','500','380'
    for(var k = 0; k<index.length; k++){
        var xhr = new XMLHttpRequest();
        var url = 'https://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle?ServiceKey=bfQaHP%2BFi%2BOOLU395HAy3hwkmZet3dvKWVarBwy6TFKT4akYaskc1uqJVLp27%2FoQPFUQ82ipZ3wgFmzDHaz5EA%3D%3D&searchYearCd=2021&siDo=11&guGun='+index[k]+'&type=json&numOfRows=100&pageNo=1&accept:application/json';
        xhr.open('GET', url);




        xhr.onreadystatechange = function () {
            //           if (this.readyState == xhr.DONE) { // <== 정상적으로 준비되었을때
            if (xhr.status == 200 || xhr.status == 201) {
                var ch = JSON.parse(this.response);
                var positions = new Array();
                for(var i=0; i<(ch.totalCount); i++){
                    positions[i] = {content: '<div>'+ch.items.item[i].spot_nm+'</div>',
                        latlng: new kakao.maps.LatLng(ch.items.item[i].la_crd, ch.items.item[i].lo_crd)};
                }

                for (var j=0; j<(positions.length); j++) {

                    var markers = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[j].latlng // 마커의 위치
                    });

                    var infowindow = new kakao.maps.InfoWindow({
                        content: positions[j].content
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
    //    }

</script>

</body>
</html>