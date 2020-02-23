package com.nf.dao;

import com.nf.entity.TbSpu;
import com.nf.vo.SpuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbSpuDao {
    List<SpuVO> spuList(@Param("pageNum") int pageNum,
                        @Param("pageSize") int pageSize);

    List<SpuVO> spuListByTitle(@Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize,
                               @Param("title")String title);

    boolean insertSpu(TbSpu TbSpu);

    boolean deleteSpuById(int id);

    boolean updateSpuById(TbSpu tbSpu);

    List<TbSpu> spuAll();

    List<TbSpu> spuListByCid(@Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize,
                               @Param("cid")int cid);

}
