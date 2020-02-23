package com.nf.entity;

import lombok.Data;

@Data
public class Brand {
    private Integer id;
    private String brandName;
    private String brandImage;
    private String letter;

    public Brand() {
    }

    public Brand(String brandName, String brandImage, String letter, int id) {
        this.brandName = brandName;
        this.brandImage = brandImage;
        this.letter = letter;
        this.id = id;
    }

    public Brand(String brandName, String brandImage, String letter) {
        this.brandName = brandName;
        this.brandImage = brandImage;
        this.letter = letter;
    }
}
