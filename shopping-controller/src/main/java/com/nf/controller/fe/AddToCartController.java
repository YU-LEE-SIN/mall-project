package com.nf.controller.fe;

import com.nf.entity.Cart;
import com.nf.entity.CartItem;
import com.nf.entity.TbSku;
import com.nf.service.SkuService;
import com.nf.vo.ResponseVO;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/index")
public class AddToCartController {
    @Autowired
    private SkuService skuService;

    @RequestMapping("/addToCart")
    @ResponseBody
    public ResponseVO addToCart(int skuId, int count, HttpSession session) {
        TbSku sku = skuService.skuListById(skuId);
        //购物项
        CartItem cartItem=new CartItem(sku,count);
        //加购物车
        addToCart(session,cartItem);
        return ResponseVO.newBuilder().code("200").build();
    }

    private void addToCart(HttpSession session, CartItem cartItem) {
        //先看车里有没有
        Cart cart=(Cart)session.getAttribute("cart");
        if(cart!=null){
            cart.addCartItem(cartItem);
        }else{
            cart = new Cart();
            cart.addCartItem(cartItem);
            session.setAttribute("cart", cart);
        }
    }
}
