package com.nf.service;

import com.nf.entity.AttributeKey;

import java.util.List;

public interface AttributeKeyService {
    List<AttributeKey> attributeList(int pageNum, int pageSize);
    List<AttributeKey> attributeByCid(int pageNum, int pageSize, int cid);
    boolean insertAttr(AttributeKey attributeKey);
    boolean upAttribute(AttributeKey attributeKey);
    boolean delAttrubute(int id);
}
