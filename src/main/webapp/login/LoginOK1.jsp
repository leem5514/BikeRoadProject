<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
Form Test OK!!! <br> <br>
<%
    request.setCharacterEncoding("UTF_8");
    String sID = request.getParameter("mID");
    String sPWD = request.getParameter("mPWD");
    String sSave = request.getParameter("mSave");

    if(sID.equals("admin2") && sPWD.equals("1234")){
        session.setAttribute("ssUid", sID);
        session.setAttribute("ssUpwd", sPWD);
        out.println("로그인 성공, 세션 생성 OK! <br>");
        //ID 쿠키에 저장
        if(sSave.equals("Y")){
            Cookie MyCooksUid = new Cookie("ckUserID", sID);
            response.addCookie(MyCooksUid);
            out.println("쿠키를 생성하였습니다. <br>");
        }

%>
<a href="../Index.jsp">홈으로</a> <br> <br>
<%
}else{
    out.println("로그인 및 세션 생성 실패! <br>");
    out.println("다시 시도해 보세요. <br>");
%>
<a href="Login.jsp">로그인</a> <br> <br>
<%
    }
    //로그인 성공하면 홈으로 나오고 로그인 실패하면 로그인으로 가게
%>




</body>
</html>