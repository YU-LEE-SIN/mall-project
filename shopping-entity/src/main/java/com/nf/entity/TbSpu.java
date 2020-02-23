package com.nf.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class TbSpu {
    private Integer id;
    /*标题*/
    private String title;
    /*子标题*/
    private String subTitle;
    private String image;
    private Integer cid;
    private Integer bid;
    private BigDecimal pricing;

    public TbSpu() {
    }

    public Boolean getIsSaleable() {
        return saleable;
    }

    public void setIsSaleable(Boolean saleable) {
        this.saleable = saleable;
    }

    private Boolean saleable;
    private Date createTime;
    private Date lastUpdateTime;

}
