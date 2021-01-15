package com.veveup.service.impl;

import com.veveup.dao.MessageDao;
import com.veveup.domain.Message;
import com.veveup.service.MessageServiceDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MessageServiceImpl implements MessageServiceDao {

    @Autowired
    MessageDao messageDao;

    @Override
    public List<Message> findAll() {
        return messageDao.findAll();
    }

    @Override
    public List<Message> findAllVisiable() {
        return messageDao.findAllVisiable();
    }

    @Override
    public void insertMessage(Message message) {
        messageDao.InsertMessage(message);
    }

    @Override
    public void setHiddenById(Integer id) {
        messageDao.setHiddenById(id);
    }

    @Override
    public void addLikes(Integer id) {
        messageDao.addLikesById(id);
    }

    @Override
    public void miuisLikes(Integer id) {
        messageDao.minusLikesById(id);
    }

    @Override
    public Message getMessageById(Integer id) {
        return messageDao.findMessageById(id);
    }

    @Override
    public void updateMessage(Message message) {
        messageDao.updateMessage(message);
    }
}
