package com.example.bikebike.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
    public Connection connDB() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/class2jsp";
            String user = "root";
            String pwd = "1234";

            connection = DriverManager.getConnection(url, user, pwd);
            if (connection != null) {
                System.out.println("연결 성공");
            }
        } catch (Exception e) {
            System.out.println("연결 오류 발생");
            e.printStackTrace();
        }
        return connection;
    }

    public void insert(String title, String content, String writer) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        try {

            connection = connDB();
            String query = "insert board (title, content, Writer, RegDate) values ('"+ title +"','" + content +"','"+ writer +"', Now())";

            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public ArrayList<BoardDTO> select() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<BoardDTO> BoardList = new ArrayList<BoardDTO>();

        try {
            connection = connDB();
            String query = "select * from board";

            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery(query);


            if (resultSet.isBeforeFirst() == false) {
                System.out.println("비어있음");
            } else {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    String content = resultSet.getString("content");
                    String writer = resultSet.getString("Writer");
                    String regDate = resultSet.getString("regDate");

                    BoardDTO vo = new BoardDTO();
                    vo.setId(id);
                    vo.setTitle(title);
                    vo.setContent(content);
                    vo.setWriter(writer);
                    vo.setRegdate(regDate);

                    BoardList.add(vo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return BoardList;
    }
    public void delete(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        try {
            connection =connDB();
            String query = "delete from board where id ='"+ id +"';";

            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void edit(String title, String content,int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int resultSet = 0;

        try {
            connection =connDB();
            String query = "update board set title = '"+ title +"', content = '"+ content +"', RegDate = Now() where id = '"+ id +"';";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
