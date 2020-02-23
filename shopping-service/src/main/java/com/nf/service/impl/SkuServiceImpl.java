package com.nf.service.impl;

import com.nf.dao.TbSkuDao;
import com.nf.entity.TbSku;
import com.nf.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SkuServiceImpl implements SkuService {
    @Autowired
    private TbSkuDao tbSkuDao;
    @Override
    public boolean insertTbSku(TbSku tbSku) {
        return tbSkuDao.insertTbSku(tbSku);
    }

    @Override
    public List<TbSku> skuListBySpuId(int pageNum, int pageSize, int spuId) {
        return tbSkuDao.skuListBySpuId(pageNum, pageSize, spuId);
    }


    @Override
    public boolean deleteSkuById(int id) {
        return tbSkuDao.deleteSkuById(id);
    }

    @Override
    public List<TbSku> skuList(int pageNum, int pageSize) {
        return tbSkuDao.skuList(pageNum,pageSize);
    }

    @Override
    public TbSku skuListById(int id) {
        return tbSkuDao.skuListById(id);
    }

}
