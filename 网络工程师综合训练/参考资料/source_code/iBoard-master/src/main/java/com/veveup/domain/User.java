package com.veveup.domain;

import java.io.Serializable;

/**
 * 0:Systetm
 * 1:Admin
 * 2:User
 * 3:Guest
 */

public class User implements Serializable {
    private Integer uid;
    private String name;
    private String password;
    private String email;
    private Integer level;
    // 权限定义
    // 系统初始定义 不使用
    public static Integer System = 0;
    // 管理员用户 拥有User及添加删除User Message 等管理权限
    public static Integer Admin = 1;
    // 普通注册用户 拥有Guest及自己Info Message 更改删除权限
    public static Integer User = 2;
    // 查看全部可见 点赞👍 查看/发送匿名 Message
    public static Integer Guest = 3;

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", level=" + level +
                '}';
    }
}
