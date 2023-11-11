<%@ page import="com.example.bikebike.board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    PrintWriter script = response.getWriter();
    int Id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDAO boardDAO = new BoardDAO();
    boardDAO.edit(title, content, Id);
    script.println("<script>");
    script.println("alert('게시물이 수정되었습니다.')");
    script.println("location.href = 'Board.jsp'");
    script.println("</script>");
%>
</body>
</html>
