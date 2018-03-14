package com.dream.controller;

import com.dream.common.Page;
import com.dream.po.User;
import com.dream.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/list")
    public String getUserList(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="5")Integer rows, String username, Model model) {

        Page<User> users = userService.findUserList(page, rows, username);
        model.addAttribute("page", users);
        return "userManage";
    }


}
