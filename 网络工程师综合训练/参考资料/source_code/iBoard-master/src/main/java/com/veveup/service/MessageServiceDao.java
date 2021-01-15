package com.veveup.service;

import com.veveup.domain.Message;

import java.util.List;

public interface MessageServiceDao {
    List<Message> findAll();

    List<Message> findAllVisiable();

    void insertMessage(Message message);

    void setHiddenById(Integer id);

    void addLikes(Integer id);

    void miuisLikes(Integer id);

    Message getMessageById(Integer id);

    void updateMessage(Message message);

}
