package com.xrluo.system.service;

import com.xrluo.mbg.model.User;

import java.util.List;

public interface UserService {

    List<User> list(Integer pageSize, Integer pageNum);


}
