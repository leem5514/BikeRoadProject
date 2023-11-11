<%@ page import="com.example.bikebike.board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.bikebike.board.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
    <title>게시판</title>
    <link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
<%
    System.out.println((String)session.getAttribute("ID"));
    BoardDAO boardDAO = new BoardDAO();
    ArrayList<BoardDTO> BoardList = boardDAO.select();
    request.setAttribute("BoardList", BoardList);
%>
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
            <a href="login.jsp" class="logincheck">로그인&nbsp;&nbsp;/&nbsp;&nbsp;</a>
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
            <a href="board.html" class="Board">Board</a>
        </li>
        <li class>
            <a href="danger.html" class="Danger">Danger</a>
        </li>
        <li class>
            <a href="bikeRental.jsp" class="Locker">Locker</a>
        </li>
    </ul>
</div>

<hr />
</div>
<!-- 게시판 본문 -->
<div class="board_wrap">
    <div class="board_title">
        <strong>게시판</strong>
    </div>
    <div class="board_list_wrap">
        <div class="board_list">
            <div class="top">
                <div class="num">번호</div>
                <div class="title">제목</div>
                <div class="writer">글쓴이</div>
                <div class="date">작성일</div>
            </div>

            <c:forEach items="${BoardList}" var="item" varStatus="i">
            <div>
                <div class="num"><c:out value="${item.id}"/></div>
                <div class="title"><a href="<c:url value="/Post.jsp?id=${item.id}&title=${item.title}&content=${item.content}&writer=${item.writer}&regdate=${item.regdate}"/>"><c:out value="${item.title}"/></a></div>
                <div class="writer"><c:out value="${item.writer}"/></div>
                <div class="date"><c:out value="${item.regdate}"/></div>
            </div>
            </c:forEach>
        </div>
        <!-- 글쓰기버튼 -->
        <div class="bt_wrap">
            <a href="Writing.jsp" class="on">글쓰기</a>
        </div>
        <!-- 페이지바 -->
        <div class="board_page">
            <a href="#" class="bt first"><<</a>
            <a href="#" class="bt prev"><</a>
            <a href="#" class="num on">1</a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="num">4</a>
            <a href="#" class="num">5</a>
            <a href="#" class="bt next">></a>
            <a href="#" class="bt last">>></a>
        </div>
    </div>
</div>
</body>
</html>
