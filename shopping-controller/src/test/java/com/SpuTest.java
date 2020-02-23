package com;

import com.nf.entity.Category;
import com.nf.entity.TbSku;
import com.nf.entity.TbSpu;
import com.nf.service.SkuService;
import com.nf.service.SpuService;
import com.nf.vo.SpuVO;
import config.AppConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class SpuTest {
    @Autowired
    private SkuService service;
    @Test

    public void queryList(){
        List<TbSku> result =  service.skuListBySpuId(1, 4,1);
        for (TbSku TbSku : result) {
            System.out.println("spuVO = " + TbSku);
        }
    }
}
