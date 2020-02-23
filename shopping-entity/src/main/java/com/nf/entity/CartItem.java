package com.nf.entity;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CartItem {
    private TbSku sku;
    private int count;

    public CartItem(){}
    public CartItem(TbSku sku){
        this(sku,1);
    }
    public CartItem(TbSku sku,int count){
        this.sku = sku;
        this.count = count;
    }
    //小计
    public BigDecimal getSubTotal(){
        //单价X数量
        return this.sku.getPrice().multiply(new BigDecimal(count));
    }
}
