package com.dream.service;

import com.dream.common.Page;
import com.dream.po.User;

public interface UserService {

    // 查询用户列表
    public Page<User> findUserList(Integer page, Integer rows);
}
