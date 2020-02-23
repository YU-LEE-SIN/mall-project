package com.nf.service;


import com.nf.entity.TbSpu;
import com.nf.vo.SpuVO;

import java.util.List;

public interface SpuService {
    List<SpuVO> spuList(int pageNum, int pageSize);
    List<SpuVO> spuListByTitle(int pageNum, int pageSize,String title);
    boolean deleteSpuById(int id);
    boolean insertSpu(TbSpu tbSpu);
    boolean updateSpu(TbSpu tbSpu);
    List<TbSpu> spuListByCid(int pageNum, int pageSize,int cid);
    List<TbSpu> spuAll();
}
