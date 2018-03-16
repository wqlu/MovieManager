package com.dream.service.impl;

import com.dream.common.Page;
import com.dream.mapper.UserMapper;
import com.dream.po.User;
import com.dream.po.UserExample;
import com.dream.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public Page<User> findUserList(Integer page, Integer rows, String username) {
        User user = new User();

        if (StringUtils.isNotBlank(username)) {
            user.setUsername(username);
        }
        // 当前页
        user.setStart((page-1)*rows);
        // 每页数
        user.setRows(rows);
        List<User> users = userMapper.selectUserList(user);
        // 总记录
        Integer count = userMapper.selectUserListCount(user);
        Page<User> result = new Page<>();
        result.setPage(page);
        result.setRows(users);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User getUserById(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public void addUser(User user) {
        userMapper.insert(user);
    }
}
