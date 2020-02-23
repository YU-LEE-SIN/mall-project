package com.nf.dao;

import com.nf.entity.TbSku;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbSkuDao {
    boolean insertTbSku(TbSku tbSku);
    boolean deleteSkuById(int id);
    boolean updateSkyById(TbSku tbSku);
    List<TbSku> skuListBySpuId(@Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize,
                               @Param("spuId") int spuId);

    List<TbSku> skuList(@Param("pageNum") int pageNum,
                        @Param("pageSize") int pageSize);

    TbSku skuListById(int id);
}