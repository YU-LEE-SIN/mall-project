package com;

import com.nf.entity.Category;
import com.nf.entity.TbSku;
import com.nf.service.CategoryService;
import com.nf.service.SkuService;
import config.AppConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class Sku {
    @Autowired
    private SkuService service;
    @Test
    public void getAll(){
        TbSku result = service.skuListById(1);

    }
}
