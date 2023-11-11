package com.example.bikebike.AccidentFrequent;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
  public static void main(String[] args) throws IOException {
    //1. URL을 만들기 위한 StringBuilder
    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle"); /*URL*/
    //2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키
    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=bfQaHP%2BFi%2BOOLU395HAy3hwkmZet3dvKWVarBwy6TFKT4akYaskc1uqJVLp27%2FoQPFUQ82ipZ3wgFmzDHaz5EA%3D%3D"); /*Service Key*/
    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
    urlBuilder.append("&" + URLEncoder.encode("stationName","UTF-8") + "=" + URLEncoder.encode("수내동", "UTF-8")); /*측정소 이름*/
    urlBuilder.append("&" + URLEncoder.encode("dataTerm","UTF-8") + "=" + URLEncoder.encode("DAILY", "UTF-8")); /*요청 데이터기간 (하루 : DAILY, 한달 : MONTH, 3달 : 3MONTH)*/
    urlBuilder.append("&" + URLEncoder.encode("ver","UTF-8") + "=" + URLEncoder.encode("1.3", "UTF-8")); /*버전별 상세 결과 참고문서 참조*/
    // 3. URL 객체 생성.
    URL url = new URL(urlBuilder.toString());
    // 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    // 5. 통신을 위한 메소드 SET.
    conn.setRequestMethod("GET");
    // 6. 통신을 위한 Content-type SET.
    conn.setRequestProperty("Content-type", "application/json");
    // 7. 통신 응답 코드 확인.
    System.out.println("Response code: " + conn.getResponseCode());
    // 8. 전달받은 데이터를 BufferedReader 객체로 저장.
    BufferedReader rd;
    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
      rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    } else {
      rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
    }
    // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
    StringBuilder sb = new StringBuilder();
    String line;
    while ((line = rd.readLine()) != null) {
      sb.append(line);
    }
    // 10. 객체 해제.
    rd.close();
    conn.disconnect();
    // 11. 전달받은 데이터 확인.
    System.out.println(sb.toString());
  }
}
