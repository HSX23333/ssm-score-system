package com.ssm.entity;

public class Score {
    private Integer id;
    private Integer stuId;    // 改为学号
    private String course;
    private Float score;

    // getter/setter
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public Integer getStuId() { return stuId; }
    public void setStuId(Integer stuId) { this.stuId = stuId; }
    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }
    public Float getScore() { return score; }
    public void setScore(Float score) { this.score = score; }
}