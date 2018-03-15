package com.dream.service;

import com.dream.common.E3Result;
import com.dream.common.Page;
import com.dream.po.Admin;

/**
 * Created by ZXL on 2018/3/2.
 */
public interface AdminService {
    E3Result adminLogin(String adminname, String adminpassword);

    public Page<Admin> findAdminList(Integer page, Integer rows, String username);
}
