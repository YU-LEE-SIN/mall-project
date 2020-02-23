package com.nf.controller.fe;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.nf.entity.User;
import com.nf.service.UserService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/index")
public class UserController {

    @Autowired
    private UserService service;

    @ResponseBody
    @RequestMapping("/xxx")
    public ResponseVO addUser(@Valid User user, BindingResult bindingResult) {
        ResponseVO vo = ResponseVO.newBuilder().build();
        if (bindingResult.hasErrors()) {
            List<FieldError> errorList = bindingResult.getFieldErrors();
            for (FieldError error : errorList) {
                ResponseVO.newBuilder().code("500").msg(error.getDefaultMessage()).build();
            }
        } else {
            service.insertUser(user);
              ResponseVO.newBuilder().code("200").msg("successful").build();
        }
        return null;
    }

    @RequestMapping("/user/register")
    public ModelAndView register(@Valid User user, BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView();
        if (bindingResult.hasErrors()) {
            List<FieldError> errorList = bindingResult.getFieldErrors();
            for (FieldError error : errorList) {
                mav.addObject(error.getField(), error.getDefaultMessage());
            }
            mav.setViewName("fe/register");
        } else {
            service.insertUser(user);
            mav.setViewName("fe/login");
        }
        return mav;
    }

    @ResponseBody
    @RequestMapping("/user/verify")
    public ResponseVO verify(String username) {
        if (service.checkUsername(username) != null) {
            return ResponseVO.newBuilder().code("false").msg("exist").build();
        } else {
            return ResponseVO.newBuilder().code("true").msg("successful").build();
        }
    }



    @RequestMapping("/user/login")
    public String index2(User user, HttpSession session,
                         HttpServletRequest request,
                         HttpServletResponse response) {
    String codeText=request.getParameter("code");
    String imgCode= (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (service.queryUser(user) != null && imgCode.equalsIgnoreCase(codeText)) {
            //登录成功
           // 判断用户是否勾选了自动登录
//             String autoLogin = request.getParameter("autoLogin");
//            if (autoLogin!=null) {
//                //需要自动登录，使用cookie
//                Cookie cookieUsername = new Cookie("cookie_username", user.getUsername());
//                Cookie cookiePassword = new Cookie("cookie_password", user.getPassword());
//                //设置持久化时间
//                cookieUsername.setMaxAge(60*10);
//                cookiePassword.setMaxAge(60*10);
//                //发送cookie
//                response.addCookie(cookieUsername);
//                response.addCookie(cookiePassword);
//                session.setAttribute("uname", user);
//            }
            session.setAttribute("uname", service.queryUser(user));
              return "fe/index";
        } else {
            request.setAttribute("loginError", "用户名或密码错误");
            return "redirect:/index/login";
        }
    }
    @Resource
    private Producer captchaProducer;
    @RequestMapping("/imgCode")
    public void imgCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
        // return a jpeg
        response.setContentType("image/jpeg");
        // create the text for the image
        String capText = captchaProducer.createText();
        // store the text in the session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }


    @RequestMapping("/exit")
    public String logInOut(HttpSession session) {
        //销毁会话
        session.invalidate();
        return "redirect:/index/first";
    }
}
