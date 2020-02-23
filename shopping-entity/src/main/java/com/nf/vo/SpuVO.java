package com.nf.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.executable.ValidateOnExecution;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class SpuVO {
    private Integer id;
    private String brandName;
    private Integer categoryId;
    private Integer brandId;
    private String brandImage;
    private String categoryName;
    private String title;
    private String subTitle;
    private String image;
    private BigDecimal pricing;

    public Boolean getIsSaleable() {
        return saleable;
    }

    public void setIsSaleable(Boolean saleable) {
        this.saleable = saleable;
    }
    private Boolean saleable;
    @JsonFormat(pattern = "yyy-MM-dd")
    private Date createTime;
    private Date lastUpdateTime;
}
