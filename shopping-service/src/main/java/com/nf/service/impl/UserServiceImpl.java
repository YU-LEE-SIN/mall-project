package com.nf.service.impl;

import com.nf.service.UserService;
import com.nf.dao.UserDao;
import com.nf.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User queryUser(User user) {
        return userDao.queryUser(user);
    }

    @Override
    public User checkUsername(String username) {
        return userDao.checkUsername(username);
    }

    @Override
    public boolean insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public List<User> AllUser() {
        return userDao.AllUser();
    }

    @Override
    public boolean delUserById(int id) {
        return userDao.delUserById(id);
    }

}
