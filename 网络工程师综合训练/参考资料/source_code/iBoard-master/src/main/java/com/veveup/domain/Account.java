package com.veveup.domain;

import java.io.Serializable;

public class Account implements Serializable {
    private Integer id;
    private String content;
    private String author;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getName() {
        return content;
    }

    public void setName(String name) {
        this.content = content;
    }


    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", author='" + author + '\'' +
                '}';
    }
}
