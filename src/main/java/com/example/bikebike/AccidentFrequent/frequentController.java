package com.example.bikebike.AccidentFrequent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class frequentController {
  private Connection conn;
  private PreparedStatement pstmt;
  private ResultSet rs;
  public frequentController() {
    try {
      String dbURL = "jdbc:mysql://localhost:3306/bike";
      String dbID = "root";
      String dbPassword = "1234";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
    }catch(Exception e) {
      e.printStackTrace();
    }
  }


  public int Kaokaojoin(String userID, String userEmail) {
    String SQL = "INSERT INTO bike.users(siDo, gugun, spot_nm, lo_crd, la_crd) VALUES(?,?,?,?,?)";
    try {
      // 각각의 데이터를 실제로 넣어준다.
      pstmt = conn.prepareStatement(SQL);
      // 쿼리문의 ?안에 각각의 데이터를 넣어준다.
      pstmt.setString(1, userID);
      pstmt.setString(2, userEmail);
      // 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
      pstmt.executeUpdate();
      return 1;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return -1;
  }



}
