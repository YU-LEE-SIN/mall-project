package com.nf.controller.be;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class HomeController {

    @RequestMapping("/index")
    public String index() {
        return "be/index";
    }

    @RequestMapping("/login")
    public String login(){
        return "be/login";
    }

    @RequestMapping("/brand")
    public String brand(){
        return "be/brand";
    }

    @RequestMapping("/category")
    public String category(){
        return "be/category";
    }

    @RequestMapping("/product")
    public String product(){
        return "be/product";
    }

    @RequestMapping("/sku")
    public String sku(){
        return "be/sku";
    }

    @RequestMapping("/attribute")
    public String attribute(){
        return "be/attribute";
    }
}
