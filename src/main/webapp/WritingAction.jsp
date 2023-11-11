<%@ page import="com.example.bikebike.board.BoardDTO" %>
<%@ page import="com.example.bikebike.board.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 8:34
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
  String title = request.getParameter("title");
  String content = request.getParameter("content");
  String writer = (String)session.getAttribute("ID");
  BoardDAO boardDAO = new BoardDAO();
  boardDAO.insert(title, content, writer);
  request.getRequestDispatcher("Board.jsp").forward(request, response);
%>
</body>
</html>
