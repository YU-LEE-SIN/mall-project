package com.nf.dao;

import com.nf.entity.Brand;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BrandDao {
    List<Brand> brandList(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    List<Brand> brandListByName(@Param("pageNum") int pageNum,
                                @Param("pageSize") int pageSize,
                                @Param("brandName") String brandName);

    boolean insertBrand(Brand brand);

    boolean deleteBrandById(int id);

    boolean updateBrandById(Brand brand);
}
