<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판수정</title>
    <link rel="stylesheet" href="css/board.css">
</head>
<body>
<%
    String Writer = request.getParameter("writer");
    String UserID = (String)session.getAttribute("ID");
    PrintWriter script = response.getWriter();

    if (UserID == null) {
        script.println("<script>");
        script.println("alert('로그아웃된 상태입니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else if (!UserID.equals(Writer)) {
        script.println("<script>");
        script.println("alert('작성자가 아닙니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>
<div class="board_wrap">
    <div class="board_title" onclick="location.href='Board.jsp'">
        <strong>게시판</strong>
        <p>내용 수정하기</p>
    </div>

    <div class="board_write_wrap">
        <form method="post" action="editAction.jsp" >
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
        <div class="board_write">
            <div class="title">
                <dl>

                    <dt>제목</dt>
                    <!-- 수정하기 전 이름 넣기 -->
                    <dd><input type="text" placeholder="제목 입력" name="title" value=""></dd>
                </dl>
            </div>
            <div class="info">
                <dl>
                    <dt>글쓴이</dt>
                    <dd><%=request.getParameter("writer")%></dd>
                </dl>
            </div>
            <div class="cont">
                <!-- 수정하기 전 내용 넣기 -->
                <textarea placeholder="내용 입력" name="content" value=""></textarea>
            </div>
        </div>
        <div class="bt_wrap">
            <input type="submit" class="on">수정</input>
            <!-- <a href="boardview.html" class="on">수정</a> -->
            <a href="javascript:window.history.go(-1);">취소</a>
        </div>
    </form>

    </div>
</div>
</body>
</html>
