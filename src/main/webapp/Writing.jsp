<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 8:24
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글작성</title>
    <link rel="stylesheet" href="css/board.css">
</head>
<body>

<%
    PrintWriter script = response.getWriter();
    if (!login) {
        script.println("<script>");
        script.println("alert('로그인 하십시오.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>
<div class="board_wrap">
    <div class="board_title" onclick="location.href='board.html'">
        <strong>게시글작성</strong>
        <p>게시글을 작성해주세요</p>
    </div>
    <div class="board_write_wrap">
        <form method="post" action="WritingAction.jsp" >
        <div class="board_write">
            <div class="title">
                <dl>
                    <dt>제목</dt>
                    <dd><input type="text" placeholder="제목 입력" name="title" id="title"></dd>
                </dl>
            </div>
            <div class="info">
                <dl>
                    <dt></dt>
                </dl>
            </div>
            <div class="cont">
                <textarea placeholder="내용 입력" name="content" id="substance"></textarea>
            </div>
        </div>
        <div class="bt_wrap">
            <button type="submit" class="on">등록</button>
            <!-- <a href="boardview.html" class="on">등록</a> -->
            <a href="javascript:window.history.go(-1);">돌아가기</a>
        </div>
        </form>
    </div>
</div>
</body>
</html>
