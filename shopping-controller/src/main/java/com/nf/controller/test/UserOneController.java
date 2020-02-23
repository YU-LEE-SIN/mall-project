package com.nf.controller.test;

import com.nf.entity.User;
import com.nf.service.UserService;
import com.nf.vo.ResponseVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api(tags = "users")
public class UserOneController {
    @Autowired
    private UserService service;
    @GetMapping("/users")
    @ApiOperation(value = "所有用户信息")
    public ResponseVO listAllUser(){
        List<User> userList=service.AllUser();
        return ResponseVO.newBuilder().data(userList).code("200").msg("ok").build();
    }
    @PostMapping("/users")
    public ResponseVO insert( User user){
        boolean flag=service.insertUser(user);
        return ResponseVO.newBuilder().code("200").msg("ok").build();
    }

    @DeleteMapping("/users/{id}")
    public ResponseVO insert(@PathVariable int id) {
        boolean flag=service.delUserById(id);
        return ResponseVO.newBuilder().code("200").msg("ok").build();
    }

    @PutMapping("/users/{id}")
    public ResponseVO updateById(@PathVariable int id, @RequestBody User user) {
        System.out.println("user = " + user);
        return ResponseVO.newBuilder().code("200").msg("ok").build();
    }
}
