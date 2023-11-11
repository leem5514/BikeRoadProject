<%@ page import="com.example.bikebike.user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>메인화면</title>
    <link rel="stylesheet" type="text/css" href="css/bicycle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>
<div class="header">
    <div class="upper">
        <div class="logo">로고화면</div>

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
            <a href="login.jsp" class="logincheck">로그인&nbsp;&nbsp;/&nbsp;&nbsp;</a>
            로그인하지 않은 상태
            <%
                }
            %>
        </div>

    </div>
</div>

<div class="header-center">
    <ul>
        <li class>
            <a href="map.jsp" class="map">MAP</a>
        </li>
        <li class>
            <a href="Board.jsp" class="board">Board</a>
        </li>
        <li class>
            <a href="BicycleAccidentFrequentAreas/accidentlist2.jsp" class="danger">Danger</a>
        </li>
        <li class>
            <a href="bikeRental.jsp" class="Locker">Locker</a>
        </li>
    </ul>
</div>

<hr />

</div>
<!-- 슬라이드 이미지 -->
<div class="slider-1">
    <div class="slides">
        <div class="active" style="background-image:url(image/bye1.jpg);"></div>
        <div style="background-image:url(image/bye2.jpg);"></div>
        <div style="background-image:url(image/bye3.jpg);"></div>
        <div style="background-image:url(image/bye4.jpg);"></div>
        <div style="background-image:url(image/bye5.jpg);"></div>
    </div>
    <div class="page-btns">
        <div class="active"></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>

    <div class="side-btns">
        <div>
            <span><i class="fas fa-angle-left"></i></span>
        </div>
        <div>
            <span><i class="fas fa-angle-right"></i></span>
        </div>
    </div>
</div>
<script src="js/bicycle.js"></script>

<div class="blank"></div>

<!-- map으로 가는 배너 -->
<div class="mapshortcut">
    <div class="mapshortcut_con">
        <h2>
            <em>Let's take a RIDE.</em>
            BICYCLE
        </h2>
        <p>
            "처음 보는 새로운 도로로"
            <span>최적의 길을 제공합니다</span>
        </p>
        <div class="cut_btn main_btn">
            <a href="map.jsp">지도보기</a>
        </div>
    </div>
    <div class="mapshortcut_img">
        <image src="image/park.png" width="1063" height="349" alt="자전거산책로"></image>
    </div>
</div>
<!-- 위험 구간 알려주는 배너 -->
<div class="dangershortcut">
    <div class="dangershortcut_con">
        <h2>
            <em>Be Careful DANGER SIDE.</em>
            CAUTION
        </h2>
        <p>
            "혹시 모를 위험 사고 구간을"
            <span>미리 제시해 방지합니다</span>
        </p>
        <div class="cut_btn danger_btn">
            <a href="danger.html">위험구간보기</a>
        </div>
    </div>
    <div class="dangershortcut_img">
        <image src="image/caution.png" width="400" height="150" alt="위험구간보기"></image>
    </div>
</div>

<div class="blank"></div>

<div class="main_buttom">

    <!-- 보드 화면 -->
    <div class="main_bn main_board">
        <h2>게시판</h2>
        <a href="Board.jsp">게시판보기</a>
    </div>

    <div class="main_bnright">
        <!-- 업데이트 -->
        <div class="main_update">
            <h2>업데이트</h2>
            <div class="more_btn">
                <a href="update.jsp">more > </a>
            </div>
            <ul>
                <li>릴리즈 0.0.1 버젼 업데이트</li>
                <li>릴리즈 0.0.1.2 오류 수정</li>
                <li>닐씨 정보 및 로그인 오류 수정</li>
            </ul>
        </div>

    </div>
    <!-- 날씨 -->

    <div class="weather-container">
        <h2>날씨정보</h2>
        <div class="weather-icon" id="weather-icon"></div>
        <div>
            <h2 id="city-name"></h2>
            <p id="temperature"></p>
        </div>
    </div>
    <script>

        // OpenWeatherMap API 키
        const apiKey = "2f9a2fa39fccfdbe843e3eb7e3b73d8f";
        // 위치 정보 (도시 이름, 국가 코드)
        const city = "Seoul,KR";
        // API 요청 URL
        const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}`;

        // API 호출 및 날씨 정보 표시
        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                const weatherIcon = data.weather[0].icon;
                const iconUrl = `http://openweathermap.org/img/w/${weatherIcon}.png`;
                const weatherIconElement = document.getElementById("weather-icon");
                weatherIconElement.style.backgroundImage = `url(${iconUrl})`;

                const cityNameElement = document.getElementById("city-name");
                cityNameElement.textContent = data.name;

                const temperatureElement = document.getElementById("temperature");
                const temperature = data.main.temp - 273.15;
                temperatureElement.textContent = ` ${temperature.toFixed(1)}°C`;
            })
            .catch(error => {
                console.log("Error fetching weather data:", error);
            });
    </script>

</div>

<!-- 가장 아래 화면 -->
<div class="under">
    <div class="firstunder">
        <ul>
            <li class>
                <a href="policy.jsp" class="profile">개인정보처리방침</a>
            </li>
            <li class>
                <a href="reference.jsp" class="refer">참고</a>
            </li>
            <li class>
                <a href="" class="nearby">주변스토어안내</a>
            </li>
        </ul>
    </div>
    <div class="secondunder">
        <h2>산책길</h2>
        <p>DaelimUniversity&nbsp; &nbsp;  |&nbsp; &nbsp; 경기도 안양시 동안구 임곡로 29 | tel : 031-467-4700&nbsp;&nbsp;  | &nbsp; &nbsp; 대표 : 이상현 김성재 양혜민 온준영 이명규 한동길</p>
        <h3></h3>
        <span>ⓒ2023 DAELIMUNIVERSITY 5 COMPANY. ALL RIGHTS RESERVED.</span>
    </div>

</div>

</body>
</html>