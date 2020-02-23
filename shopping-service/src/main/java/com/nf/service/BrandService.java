package com.nf.service;

import com.nf.entity.Brand;

import java.util.List;

public interface BrandService {
    List<Brand> brandList(int pageNum, int pageSize);
    List<Brand> brandListByName(int pageNum, int pageSize,
                                String brandName);
    boolean insertBrand(Brand brand);
    boolean deleteBrandById(int id);
    boolean updateBrandById(Brand brand);
}
