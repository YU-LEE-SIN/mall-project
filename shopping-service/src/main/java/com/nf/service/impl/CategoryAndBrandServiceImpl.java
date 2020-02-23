package com.nf.service.impl;

import com.nf.service.CategoryAndBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryAndBrandServiceImpl implements CategoryAndBrandService {
    @Autowired
    private CategoryAndBrandService service;
    @Override
    public boolean insertCateAndBran(int categoryId, int brandId) {
        return service.insertCateAndBran(categoryId, brandId);
    }
}
