package com.dream.service.impl;

import com.dream.common.Page;
import com.dream.mapper.UserMapper;
import com.dream.po.User;
import com.dream.po.UserExample;
import com.dream.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public Page<User> findUserList(Integer page, Integer rows) {
        User user = new User();

        // 当前页
        user.setStart((page-1)*rows);
        // 每页数
        user.setRows(rows);
        UserExample example = new UserExample();
        List<User> users = userMapper.selectByExample(example);
        // 总记录
        Integer count = users.size();
        Page<User> result = new Page<>();
        result.setPage(page);
        result.setRows(users);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }
}
