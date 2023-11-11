<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: khdg1
  Date: 2023-06-06
  Time: 오후 8:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  session.invalidate();
%>
<html>
<head>
    <title>로그아웃</title>
</head>
<body>
<%
  PrintWriter script = response.getWriter();
  script.println("<script>");
  script.println("alert('로그아웃 되었습니다.')");
  script.println("location.href = 'index.jsp'");
  script.println("</script>");
%>
</body>
</html>