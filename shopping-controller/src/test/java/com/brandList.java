package com;

import com.nf.service.BrandService;
import com.nf.entity.Brand;
import config.AppConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class brandList {

    @Autowired
    BrandService service;
    @Test
    public void pageListAll() {
        List<Brand> result = service.brandList(1, 3);
        for (Brand One : result) {
            System.out.println("-----debug: One = " + One);
        }
    }
    @Test
    public void delete(){
        service.deleteBrandById(115);
    }
    @Test
    public void update(){
        Brand brand=new Brand("微软(Microsoft)","","M",114);
        service.updateBrandById(brand);
    }
    @Test
    public void insert(){
        Brand brand=new Brand("微软2(Microsoft)","","M");
        service.insertBrand(brand);
    }
    @Test
    public void queryByName(){
        List<Brand> result = service.brandListByName(1, 3,"H");
        for (Brand One : result) {
            System.out.println("-----debug: One = " + One);
        }
    }

}