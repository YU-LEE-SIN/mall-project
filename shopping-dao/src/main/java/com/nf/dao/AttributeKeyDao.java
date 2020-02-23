package com.nf.dao;

import com.nf.entity.AttributeKey;
import com.nf.entity.Brand;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttributeKeyDao {
    List<AttributeKey> attributeList(@Param("pageNum") int pageNum,
                                 @Param("pageSize") int pageSize);
    List<AttributeKey> attributeByCid(@Param("pageNum") int pageNum,
                                      @Param("pageSize") int pageSize,
                                      @Param("cid") int cid);

    boolean insertAttr(AttributeKey attributeKey);

    boolean delAttrubute(int id);
    boolean upAttribute(AttributeKey attributeKey);
}
