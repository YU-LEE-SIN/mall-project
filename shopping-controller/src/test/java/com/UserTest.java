package com;

import com.nf.service.UserService;
import com.nf.entity.User;
import config.AppConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class UserTest {
    @Autowired
    private UserService service;
    @Test
    public void seles(){
        User user = new User("admin","admin");
        user=service.queryUser(user);
    }
}
