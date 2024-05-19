# bicycleProject

+ 2023년 6~8월 2차 프로젝트
    - 주요기능 : 로그인 관련 기능, KAKAO API, 게시판 작성, WEATHER API, kakao Map
    - JAVA 기반 개발
 
## 목차
1. [개요](#개요)
2. [주 이용자](#주-이용자)
3. [개발 환경](#개발-환경)
4. [사용 기술](#사용-기술)
5. [실행 방법](#실행-방법)
6. [ERD](#erd)
7. [화면 외 구성](#화면-구성)
8. [시현영상](#시현-영상)


## 개요
공유 자전거의 서비스를 시작하고 나서 공유 자전거의 이용율은 증가하는 중이다. 서울의 공유자전거 통계를 확인할 떄 2023년 1월에는 평균 50000 의 일일 사용자가 있으면 4월에는 12만 일일 이용자가 있었다.<br>
이렇게 날씨의 변화 또는 인식의 변화에 따라 자전거를 타는 이용자 수는 증가하고 있다. 하지만 공유자전거가 어디에 배치가 되어 있는지는 직접 발로 뛰던가 서울시 공유자전거 위치 현황을 볼 수 있는 사이트를 통해서만 알 수 있다. 더불어 자전거를 타기에 좋은 날씨인가, 자전거 사고다발 구역은 어디인가, 편하게 이용할 자전거 길은 어디있는가, 이러한 의문점들을 하나하나 찾아보려면 시간이 걸리기 때문에 이러한 문제점을 해결하고자 앞선 기능을 모두 가지고 있는 자전거 커뮤니티 사이트를 생성하는 것을 의의로 두고 있다.<br>

## 주 이용자
자전거 이용자, 자전거를 취미로 하는 소비자
## 개발 환경
![image](https://github.com/leem5514/CocktailProject/assets/116091798/df032a32-7a9a-48b8-aa67-926feeb84821)![image](https://github.com/leem5514/CocktailProject/assets/116091798/f824aa42-51a5-4446-8883-81639f5641aa)![image](https://github.com/leem5514/CocktailProject/assets/116091798/a319994e-0c89-458b-8e6c-dddcef4df672)<br>
intellij 으로 Java / javascript 구현 / visual studio code html / css / javascript 구현 
로그인 정보 및 게시판 정보 입력 기능으로 mysql DataBase 선택
## 사용 기술

![image](https://github.com/leem5514/CocktailProject/assets/116091798/5dd6bb86-cb67-41a9-bcc1-fdabc227c905) &nbsp;
![image](https://github.com/leem5514/CocktailProject/assets/116091798/a28922f2-e4fb-4d62-8ede-a51c2ac3f736) &nbsp;
![image](https://github.com/leem5514/CocktailProject/assets/116091798/4b92c401-ac71-4c36-9163-9e6e66edb039)

## 실행 방법
<code>https://tomcat.apache.org/download-90.cgi</code><br>
톰캣 9 설치 및 사용<br>

## ERD

![image](https://github.com/leem5514/bicycleProject/assets/116091798/fef1a483-2d64-4dcd-af44-f93f09901e52)

## 기타 코드
<p> WEATHER API를 통한 날씨 정보를 제공</p>
```
    <script>
        // OpenWeatherMap API 키
        const apiKey = "개인 키";
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
```

<P> 카카오 MAP API</P>


    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
    // 지도의 크기 제공
    <div id="map" style="width:100%;height:100vh;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey='제공받은 api 키'"></script>
    <script>
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.55564880, 126.91062927), //중심좌표
            level: 3
        };
        var map = new kakao.maps.Map(container, options);
        map.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);
    </script>
    
## 화면 구성
main.html<br>
![image](https://github.com/leem5514/CocktailProject/assets/116091798/89fb2a5a-83b9-46a6-9539-6eecc47c8834)
<br>
기본화면으로서 지도, 날씨정보, 로그인, 자전거 보관함 , 위험구간, 게시판 으로 이동할 수 있도록 설계
<br>
<br>
login.html
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/a12fc425-3bce-4341-9c18-dd8e48647c3d)
<br>
로그인 사이트로 회원가입하고 로그인 가능
카카오톡 api를 적용하여 카카오로도 로그인 할 수 있도록 설계
<br>
<br>
게시판 리스트 , 생성 , 수정 , 삭제 기능
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/194583cb-56bb-4e13-bf20-de51cd0775e6)
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/0c3131aa-9ef9-48d5-ac5a-ba776aeab3d8)
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/90197f21-b5cf-4d8d-90c5-343f5830e022)
<br>
<br>

자전거 도로, 위험 구역, 자전거 거치대 화면 구성
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/6a4f715a-d908-42bf-b6c3-2c58bb5d9c68)
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/8ec0d9b7-a9f1-4fa8-9395-1aab693f7593)
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/fd78721e-07cc-412b-9099-ffba33358de4)
<br>
<br>

업데이트 기록
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/a44a00fe-6284-43a2-8764-9f75611b3672)
<br>
<br>

개인정보 처리 방침
<br>
![image](https://github.com/leem5514/BikeRoadProject/assets/116091798/d3298944-8f32-4449-a7a0-c680c180ccb8)
<br>
<br>


등의 화면 구성
<br>





## 시현 영상
<a>Youtube 영상</a><br>
[![Video Label](http://img.youtube.com/vi/FVN-WD0xFwI/0.jpg)](https://youtu.be/FVN-WD0xFwI)
