package com.nf.entity;

import lombok.Data;
import lombok.ToString;

import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.xml.bind.annotation.XmlAttribute;
import java.util.Date;

@Data
public class User {
    private Integer id;
    private String username;
    @Min(3)
    private String password;
    private String phone;
    private Date created;

    public User() {

    }
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
