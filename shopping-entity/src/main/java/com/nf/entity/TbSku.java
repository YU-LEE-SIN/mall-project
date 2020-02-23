package com.nf.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class TbSku {
    private Integer id;
    private Integer spuId;
    private String title;
    private String images;
    private BigDecimal price;
    private String spec;
    private Integer stock;
    private boolean enable;
    public Boolean getIsEnable() {
        return enable;
    }
    public void setIsEnable(Boolean saleable) {
        this.enable = enable;
    }
    @JsonFormat(pattern = "yyy-MM-dd")
    private Date createTime;
}
