package com.example.bikebike.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
  private Connection conn;
  private PreparedStatement pstmt;
  private ResultSet rs;
  public UserDAO() {
    try {
      String dbURL = "jdbc:mysql://localhost:3306/class2jsp";
      String dbID = "root";
      String dbPassword = "1234";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
    }catch(Exception e) {
      e.printStackTrace();
    }
  }
  public int login(String userID, String userPassword) {
    String SQL = "SELECT * FROM users WHERE username ='" + userID + "'";
    try {
      pstmt = conn.prepareStatement(SQL);
      //pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        if (rs.getString("password").equals(userPassword))
          return 1; //로그인 성공
        else
          return 0; // 비밀번호 틀림
      }
      return -1; // 아이디 없음
    }catch(Exception e) {
      e.printStackTrace();

    }
    return -2; //DB 오류
  }

  public int KakaoLogin(String userID) {
    String SQL = "SELECT * FROM bike.kakao_users WHERE k_name ='" + userID + "'";
    try {
      pstmt = conn.prepareStatement(SQL);
      //pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        if (rs.getString("k_name").equals(userID))
          return 1; //로그인 성공
      }
      return -1; // 아이디 없음
    }catch(Exception e) {
      e.printStackTrace();
    }
    return -2; //DB 오류
  }
  public int Kaokaojoin(String userID, String userEmail) {
    String SQL = "INSERT INTO users(username, email) VALUES(?, ?)";
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


  public int join(String userID, String userPassword, String userEmail) {
    String SQL = "INSERT INTO users(username, password, email) VALUES(?, ?, ?)";
    try {
      // 각각의 데이터를 실제로 넣어준다.
      pstmt = conn.prepareStatement(SQL);
      // 쿼리문의 ?안에 각각의 데이터를 넣어준다.
      pstmt.setString(1, userID);
      pstmt.setString(2, userPassword);
      pstmt.setString(3, userEmail);
      // 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
      return pstmt.executeUpdate();

    } catch (Exception e) {
      e.printStackTrace();
    }
    return -1;
  }

  public String findId(String member_email) {
    String mid = null;

    try {
      String sql = "select username from users where email=? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member_email);

      rs = pstmt.executeQuery();

      if(rs.next()) {
        mid = rs.getString("username");
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
    return mid;
  }
  public String findPw(String member_name, String member_email) {
    String mid = null;

    try {
      String sql = "select password from users where username=? and email=? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member_name);
      pstmt.setString(2, member_email);

      rs = pstmt.executeQuery();

      if(rs.next()) {
        mid = rs.getString("password");
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
    return mid;
  }

//  public UserDTO UserInfo(String username, String password) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    ResultSet resultSet = null;
//
//    UserDTO userDTO = new UserDTO();
//
//    String SQL = "select * from users where username='" + username + "' and password='" + password + "' ";
//    try{
//      pstmt = conn.prepareStatement(SQL);
//      resultSet = pstmt.executeQuery(SQL);
//
//      Long ID = resultSet.getLong("ID");
//      String Un = resultSet.getString("username");
//      String PW = resultSet.getString("password");
//      String Em = resultSet.getString("email");
//
//      userDTO.setID(ID);
//      userDTO.setUsername(Un);
//      userDTO.setPassword(PW);
//      userDTO.setEmail(Em);
//
//    } catch (Exception e) {
//      e.printStackTrace();
//    } finally {
//      try {
//        resultSet.close();
//        pstmt.close();
//        conn.close();
//      } catch (Exception e) {
//        e.printStackTrace();
//      }
//    }
//    return userDTO;
//  }
}