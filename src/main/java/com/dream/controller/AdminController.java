package com.dream.controller;


import com.dream.common.E3Result;
import com.dream.po.Admin;
import com.dream.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/")
    public String showLogin(){

        return "adminLogin";
    }

    @RequestMapping("/{page}")
    public String showPage(@PathVariable String page){
        return page;
    }

    @RequestMapping(value="/admin/login",method = RequestMethod.POST)
    @ResponseBody
    public E3Result login(String adminname, String adminpassword, Model model, HttpServletRequest request) {
        E3Result e3Result = adminService.adminLogin(adminname, adminpassword);
        Admin admin = null;
        // 判断是否登录成功
        if (e3Result.getStatus() == 200) {
            admin= (Admin) e3Result.getData();
        }
        model.addAttribute("madmin", admin);
        request.getSession().setAttribute("admin", admin);
        // 返回结果
        return e3Result;
    }
}
