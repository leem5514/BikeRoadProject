<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.example.bikebike.user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="com.example.bikebike.user.UserDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="username"/>
<jsp:setProperty name="user" property="password"/>
<jsp:setProperty name="user" property="email"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP BBS</title>
</head>
<body>
    <%
		String id = request.getParameter("userID");
		String pw = request.getParameter("userPassword");
		String email = request.getParameter("userEmail");

    	if (id == null || pw == null || email == null){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 문항을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
    	}
    	else{
    		UserDAO userDAO = new UserDAO();
            int result = userDAO.join(id, pw, email);
	            if (result == -1){ // 회원가입 실패시
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('아이디 또는 이메일이 이미 존재합니다.')");
	                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
	                script.println("</script>");
           		 }
	            else{ // 회원가입 성공시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'index.jsp'");    // 메인 페이지로 이동
                script.println("</script>");
            	}
    	}
    %>
 
</body>
</html>