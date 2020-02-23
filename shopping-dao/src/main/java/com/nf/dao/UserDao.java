package com.nf.dao;

import com.nf.entity.User;

import java.util.List;

public interface UserDao {
    User queryUser(User user);
    User checkUsername(String username);
    boolean insertUser(User user);

    List<User> AllUser();
    boolean delUserById(int id);
}
