package com.nf.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    //一个购物车
    private Map<Integer, CartItem> carts = new HashMap<>();
    public void addCartItem(CartItem item){
        //车里的一个商品
        CartItem itemInCart = carts.get(item.getSku().getId());
        if(itemInCart!=null) {
            //如果购物车里有东西,就在原来数量的基础上加,现在的数量,
            itemInCart.setCount(itemInCart.getCount()+item.getCount());
        }else {
            //否则 ,把商品放到购物车中.
            carts.put(item.getSku().getId(),item);
        }
    }

    /**
     * 用于遍历购物车项集合里的值
     * @return
     */
    public List<CartItem> getItems(){
        return new ArrayList<CartItem>(carts.values());
    }


    //总数量
    public int getItemCount() {
        //开始时是0个
        int total = 0;
        for(CartItem item:carts.values()){
            total += item.getCount();
        }
        return total;
    }
    //移除一个商品
    public void removeItems(Integer skuId) {
        CartItem itemInCart = carts.get(skuId);
        if(itemInCart==null) {
            return ;
        }
        carts.remove(skuId);
    }

    /**
     *  移除某个商品的一定数量
     */
    public void removeItems(Integer id, Integer count) {
        CartItem itemInCart=carts.get(id);
        if(itemInCart==null) {
            return ;
        }
        //购物项的原数量,减输入的数量
        Integer newValue=itemInCart.getCount()-count;
        //数量<=0就移除
        if(newValue<=0) {
            carts.remove(id);
        }else {
            itemInCart.setCount(newValue);
        }
    }

    //总价格
    public BigDecimal getTotal() {
        BigDecimal total=new BigDecimal(0);
        for(CartItem item:carts.values()){
            total=total.add(item.getSubTotal());
        }
        return total;
    }
}
