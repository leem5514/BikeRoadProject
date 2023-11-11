package com.example.bikebike.AccidentFrequent;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "accidentServlet", value = "/accidentServlet")
public class accidentServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //인코딩
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    //요청받을 변수선언
    String command = request.getParameter("command");
    if(command.equals("list")){
      response.sendRedirect("accidentlist.jsp");
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
