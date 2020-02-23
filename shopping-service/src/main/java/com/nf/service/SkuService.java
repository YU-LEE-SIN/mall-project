package com.nf.service;

import com.nf.entity.TbSku;

import java.util.List;

public interface SkuService {
    boolean insertTbSku(TbSku tbSku);
    List<TbSku> skuListBySpuId(int pageNum,int pageSize,int spuId);
    boolean deleteSkuById(int id);
    List<TbSku> skuList(int pageNum,int pageSize);
    TbSku skuListById(int id);
}
