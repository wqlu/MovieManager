package com.dream.service.impl;
import com.dream.common.E3Result;
import com.dream.mapper.AdminMapper;
import com.dream.po.Admin;
import com.dream.po.AdminExample;
import com.dream.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public E3Result adminLogin(String adminname, String adminpassword) {
        // 1、判断账号和密码是否正确
        // 根据账号查询管理员信息
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andAdminnameEqualTo(adminname);
        // 执行查询
        List<Admin> list = adminMapper.selectByExample(example);
        if (list == null || list.size() == 0) {
            // 返回登录失败
            return E3Result.build(400, "用户名或密码错误");
        }
        // 取用户信息
        Admin admin = list.get(0);
        // 判断密码是否正确
        if (!DigestUtils.md5DigestAsHex(adminpassword.getBytes()).equals(admin.getAdminpassword())) {
            // 2、如果不正确，返回登录失败
            return E3Result.build(400, "用户名或密码错误");
        } else {
            return E3Result.ok(admin);
        }
    }

}
