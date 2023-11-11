<%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-17
  Time: 오후 1:16
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
    <title>업데이트내역</title>
    <link rel="stylesheet" type="text/css" href="css/update.css">
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

</div>

<!-- 본문 -->
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
    </div>

    <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>3</td>
                    <th>
                        <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                        <p>테스트</p>
                    </th>
                    <td>2023.05.15</td>
                </tr>

                <tr>
                    <td>2</td>
                    <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                    <td>2023.05.08</td>
                </tr>

                <tr>
                    <td>1</td>
                    <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                    <td>2023.05.03</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</section>
</body>
</html>
