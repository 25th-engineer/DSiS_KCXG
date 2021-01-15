package com.xrluo.system.service.impl;

import com.github.pagehelper.PageHelper;
import com.xrluo.mbg.mapper.UserMapper;
import com.xrluo.mbg.model.User;
import com.xrluo.mbg.model.UserExample;
import com.xrluo.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> list(Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);

        // 搜索条件
        UserExample example = new UserExample();
        example.setOrderByClause("id desc");

        // 搜索条件
        UserExample.Criteria criteria = example.createCriteria();

        return userMapper.selectByExample(example);
    }
}
