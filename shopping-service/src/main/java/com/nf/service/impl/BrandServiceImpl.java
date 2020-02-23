package com.nf.service.impl;

import com.nf.dao.BrandDao;
import com.nf.service.BrandService;
import com.nf.entity.Brand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandServiceImpl implements BrandService {

    @Autowired
    private BrandDao brandDao;
    @Override
    public List<Brand> brandList(int pageNum, int pageSize) {
        return brandDao.brandList(pageNum, pageSize);
    }

    @Override
    public List<Brand> brandListByName(int pageNum, int pageSize, String brandName) {
        return brandDao.brandListByName(pageNum, pageSize, brandName);
    }

    @Override
    public boolean insertBrand(Brand brand) {
        return brandDao.insertBrand(brand);
    }

    @Override
    public boolean deleteBrandById(int id) {
        return brandDao.deleteBrandById(id);
    }

    @Override
    public boolean updateBrandById(Brand brand) {
        return brandDao.updateBrandById(brand);
    }

}
