package com.dream.controller;


import com.dream.common.E3Result;
import com.dream.po.Admin;
import com.dream.service.AdminService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
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

//    @RequestMapping(value="/admin/login",method = RequestMethod.POST)
//    @ResponseBody
//    public E3Result login(String adminname, String adminpassword, Model model, HttpServletRequest request) {
//        E3Result e3Result = adminService.adminLogin(adminname, adminpassword);
//        Admin admin = null;
//        // 判断是否登录成功
//        if (e3Result.getStatus() == 200) {
//            admin= (Admin) e3Result.getData();
//        }
//        model.addAttribute("admin", admin);
//        request.getSession().setAttribute("admin", admin);
//        // 返回结果
//        return e3Result;
//    }


    @RequestMapping(value = "/admin/login", method = RequestMethod.POST)
    @ResponseBody
    public E3Result login(String adminname, String adminpassword, Model model) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(adminname, adminpassword);
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            model.addAttribute("userName", "用户名错误！");
            return E3Result.build(500, "用户名错误");
        } catch (IncorrectCredentialsException e) {
            e.printStackTrace();
            model.addAttribute("passwd", "密码错误");
            return E3Result.build(500, "密码错误" );
        }
        return E3Result.ok();
    }
}
