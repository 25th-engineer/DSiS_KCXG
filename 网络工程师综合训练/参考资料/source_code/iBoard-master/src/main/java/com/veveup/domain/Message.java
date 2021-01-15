package com.veveup.domain;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
    private Integer id;
    private String author;
    private String content;
    private String date;
    private Integer ishidden;
    private Integer likes;
    private Integer authorId;

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getIshidden() {
        return ishidden;
    }

    public void setIshidden(Integer ishidden) {
        this.ishidden = ishidden;
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", author='" + author + '\'' +
                ", content='" + content + '\'' +
                ", date='" + date + '\'' +
                ", ishidden=" + ishidden +
                ", likes=" + likes +
                ", authorId=" + authorId +
                '}';
    }
}
