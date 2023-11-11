<%@ page import="com.example.bikebike.user.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: asitw
  Date: 2023-05-23
  Time: 오후 6:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String member_id = request.getParameter("member_id");
        String member_email = request.getParameter("member_email");

        UserDAO dao = new UserDAO();
        String pwd = dao.findPw(member_id, member_email); //아이디를 디비에서 가져옴..실패시 널

    %>

    <form name="idsearch" method="post">
        <%
            if (pwd != null) {
        %>

        <div class = "container">
            <div class = "found-success">
                <h4>회원님의 비밀번호는 </h4>
                <div class ="found-id"> <%=pwd%></div>
                <h4>  입니다 </h4>
            </div>
            <div class = "found-login">
                <input type="button" id="btnLogin" value="로그인" onclick="location='login.jsp'"/>
            </div>
        </div>
        <%
        } else {
        %>
        <div class = "container">
            <div class = "found-fail">
                <h4>  등록된 정보가 없습니다 </h4>
            </div>
            <div class = "found-login">
                <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
                <input type="button" id="btnjoin" value="회원가입" onClick="location='join.jsp'"/>
            </div>
        </div>

        <div class = "adcontainer">
            <a href="#" ><img src = "../images/casead.png" /></a>
        </div>

        <%
            }
        %>
    </form>
</body>
</html>
