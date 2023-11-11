<%@ page import="com.example.bikebike.board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 10:59
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
    int Id = Integer.parseInt(request.getParameter("id"));
    String Writer = request.getParameter("writer");
    String UserID = (String)session.getAttribute("ID");
    PrintWriter script = response.getWriter();

    System.out.println(Id);
    System.out.println(Writer);
    System.out.println(UserID);

    if (UserID == null) {
        script.println("<script>");
        script.println("alert('로그아웃된 상태입니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else if (UserID.equals(Writer)) {
        BoardDAO boardDAO = new BoardDAO();
        boardDAO.delete(Id);

        script.println("<script>");
        script.println("alert('게시물이 삭제되었습니다.')");
        script.println("location.href = 'Board.jsp'");
        script.println("</script>");
    } else {
        script.println("<script>");
        script.println("alert('작성자가 아닙니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>
</body>
</html>
