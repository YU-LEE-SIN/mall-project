package com.nf.controller.fe;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class FeHomeController {

    @RequestMapping("first")
    public String first(){
        return "fe/index";
    }

    @RequestMapping("login")
    public String login(){
        return "fe/login";
    }

    @RequestMapping("register")
    public String register(){
        return "fe/register";
    }

    @RequestMapping("productList")
    public String productList(int cid, Model model) {
        model.addAttribute("cid", cid);
        return "fe/product_list";
    }

    @RequestMapping("productInfo")
    public String productInfo(int spuId, Model model) {
        model.addAttribute("spuId", spuId);
        return "fe/product_info";
    }

    @RequestMapping("toCart")
    public String toCart() {
        return "fe/view_cart";
    }
}
