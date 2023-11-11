<%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<%
    String memberId = (String)session.getAttribute("ID");
    boolean login = memberId == null ? false : true;
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 자세히 보기</title>
    <link rel="stylesheet" href="css/board.css">
</head>
<body>
<!-- 메뉴바와 로그인 화면 -->
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
            로그인하지 않은 상태
            <%
                }
            %>
        </div>
    </div>
</div>
<!-- 메뉴바 -->
<div class="header-center">
    <ul>
        <li class>
            <a href="map.jsp" class="Map">MAP</a>
        </li>
        <li class>
            <a href="Board.jsp" class="Board">Board</a>
        </li>
        <li class>
            <a href="BicycleAccidentFrequentAreas/accidentlist2.jsp" class="danger">Danger</a>
        </li>
        <li class>
            <a href="bikeRental.jsp" class="Locker">Locker</a>
        </li>
    </ul>
</div>
<hr/>
</div>
<!-- 본문내용 -->
<div class="board_wrap">
    <div class="board_title" onclick="location.href='Board.jsp'">
        <strong>게시판</strong>
        <p>상세내용</p>
    </div>
    <div class="board_view_wrap">
        <!-- 삭제버튼 -->
        <input type="button" class="delete" name="btn" value="삭제하기" onclick="location='deleteAction.jsp?id=<%= request.getParameter("id") %>&writer=<%= request.getParameter("writer") %>'">
        <!-- <div class="delete">삭제하기</div> -->
        <div class="board_view">
            <div class="title">
                제목:<%= request.getParameter("title") %>
            </div>

            <div class="info">
                <dl>
                    <dt>No.</dt>
                    <!-- 번호(id) -->
                    <dd>1</dd>
                </dl>
                <dl>
                    <dt>작성자</dt>
                    <!-- 작성자(writer) -->
                    <dd><%= request.getParameter("writer") %></dd>
                </dl>
                <dl>
                    <dt>작성시간</dt>
                    <!-- 작성일(date) -->
                    <dd><%= request.getParameter("regdate") %></dd>
                </dl>
            </div>
            <div class="cont">
                <%= request.getParameter("content") %>
            </div>
        </div>
        <div class="bt_wrap">
            <input type="submit" name="btn" value="수정" onclick="location='edit.jsp?id=<%= request.getParameter("id") %>&writer=<%= request.getParameter("writer") %>'">
            <a href="Board.jsp" >목록</a>
        </div>
    </div>
</div>
</body>
</html>
