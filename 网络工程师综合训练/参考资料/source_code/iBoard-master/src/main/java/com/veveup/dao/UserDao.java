package com.veveup.dao;

import com.veveup.domain.User;

import java.util.List;

public interface UserDao {
    /**
     * 查找所有用户
     *
     * @return
     */
    List<User> findAll();

    /**
     * 通过传入name获得用户实例
     *
     * @param name
     * @return
     */
    User findUserByName(String name);

    /**
     * 保存新用户
     */
    void insertUser(User user);

    /**
     * 传入一个更改过的用户实例 通过uid更新用户信息 可以更改name和password、email
     *
     * @param user
     */
    void updateUserByUser(User user);


}
