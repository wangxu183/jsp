package com.demo.service;

import com.demo.dao.UserMapper;
import com.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public int findUser(User user){
        return userMapper.finduser(user);
    }


    public void insertUser(User user){
         userMapper.add(user);
    }

    public int login(User user) {
        return userMapper.login(user);
    }
}
