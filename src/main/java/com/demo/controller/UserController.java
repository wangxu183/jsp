package com.demo.controller;

import com.demo.entity.User;
import com.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    UserService userService;

    //登录
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public int findUserByUserName(@RequestBody User user){
       int i=0;
       if(user.getUsername()!=null){
       i=userService.login(user);
       }
       return i;
    }

    //注册
    @RequestMapping(value = "/insertUser",method = RequestMethod.PUT)
    @ResponseBody
    public int insertUser(@RequestBody User user){
        int i=0;
        i=userService.findUser(user);
        if(i==0){
            userService.insertUser(user);
            return 1;
        }else {
            return 0;
        }

    }
}
