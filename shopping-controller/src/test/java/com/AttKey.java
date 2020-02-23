package com;

import com.nf.entity.AttributeKey;
import com.nf.service.AttributeKeyService;
import config.AppConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class AttKey {
    @Autowired
    private AttributeKeyService service;
    @Test
    public void te1(){
        List<AttributeKey> attributeKeyList = service.attributeByCid(1,4,1);
        System.out.println(attributeKeyList);
    }
}
