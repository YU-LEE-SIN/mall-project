package com.nf.controller.be;

import com.nf.entity.User;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class UserLoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/verifylogin")
    public String index2(String username,String password,
                         HttpServletRequest req , HttpSession session){

        User user= new User(username,password);
        //userService.queryUser(user);

        if ("admin".equalsIgnoreCase(user.getUsername()) && "admin".equalsIgnoreCase(user.getPassword())){
            session=req.getSession();
            session.setAttribute("uname",user);
            return "be/index";
        }else{
            return "be/login";
        }
    }

    @RequestMapping("/exit")
    public String logInOut(HttpSession session) {
        //销毁会话
        session.invalidate();
        return "redirect:/admin/index";
    }
}
