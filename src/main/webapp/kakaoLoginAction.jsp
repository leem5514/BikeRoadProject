<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import = "com.example.bikebike.user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="com.example.bikebike.user.UserDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="username"/>
<jsp:setProperty name="user" property="password"/>

<head>
    <meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
    <title>JSP BBS</title>
</head>
<body>
<% // 자바 코드 삽입
    String id = request.getParameter("kakaoid");
    String email = request.getParameter("kakaoemail");

    UserDAO userDAO = new UserDAO();
    int result = userDAO.KakaoLogin(id);
    if (result ==1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }
    else if (result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        {
            int result1 = userDAO.Kaokaojoin(id, email);
            if (result1 == 1){
                script.println("<script>");
                script.println("location.href = 'main.jsp'");
                script.println("</script>");
            }
            else if (result1 == -1){
                script.println("<script>");
                script.println("alert('오류가 발생했습니다.')");
                script.println("history.back()");    //이전 페이지로 사용자를 보냄
                script.println("</script>");
            }
        }
        script.println("</script>");
    }
    else if (result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('DB 오류가 발생했습니다.')");
        script.println("history.back()");    //이전 페이지로 사용자를 보냄
        script.println("</script>");
    }
%>
</body>
</html>