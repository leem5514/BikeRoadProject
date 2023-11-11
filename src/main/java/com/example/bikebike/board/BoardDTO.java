package com.example.bikebike.board;

public class BoardDTO {
    private int id;
    private String writer;
    private String title;
    private String content;
    private String regdate;

    public BoardDTO() { }

    public Integer getId() {
        return id;
    }
    public String getWriter() {
        return writer;
    }
    public String getTitle() {
        return title;
    }
    public String getContent() {
        return content;
    }
    public String getRegdate() {
        return regdate;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setRegdate(String regdate) { this.regdate = regdate; }
}
