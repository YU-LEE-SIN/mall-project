package com.nf.controller.fe;

import com.nf.entity.Cart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/index")
public class RemoveCartItemController {

    @RequestMapping("/removeFromCart")
    public void removefromcart(@RequestBody String[] skuId, String count, HttpSession session){
        String [] id=skuId;
        Cart cart=(Cart) session.getAttribute("cart");
        if(cart==null) {
            return;
        }
        if(count == null || count.isEmpty()) {
            removeProductspe(skuId,cart);
        }else {
            cart.removeItems(Integer.valueOf(skuId[0]),Integer.valueOf(count));
        }
    }

    private void removeProductspe(String[] skuId, Cart cart) {
        if(skuId!=null && skuId.length>0) {
            for(String id : skuId) {
                cart.removeItems(Integer.valueOf(id));
            }

        }
    }
}
