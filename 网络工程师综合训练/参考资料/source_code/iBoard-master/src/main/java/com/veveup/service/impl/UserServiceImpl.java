package com.veveup.service.impl;

import com.veveup.dao.UserDao;
import com.veveup.domain.User;
import com.veveup.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> getAll() {
        return userDao.findAll();
    }

    @Override
    public User getUserByName(String name) {
        return userDao.findUserByName(name);
    }

    @Override
    public void saveUser(User user) {
        userDao.insertUser(user);
    }

    @Override
    public void changeUserByUser(User user) {
        userDao.updateUserByUser(user);
    }
}
