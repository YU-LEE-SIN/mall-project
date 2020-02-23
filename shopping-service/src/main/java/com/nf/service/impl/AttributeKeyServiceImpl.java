package com.nf.service.impl;

import com.nf.dao.AttributeKeyDao;
import com.nf.entity.AttributeKey;
import com.nf.service.AttributeKeyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttributeKeyServiceImpl implements AttributeKeyService {
    @Autowired
    private AttributeKeyDao keyDao;
    @Override
    public List<AttributeKey> attributeList(int pageNum, int pageSize) {
        return keyDao.attributeList(pageNum,pageSize);
    }

    @Override
    public List<AttributeKey> attributeByCid(int pageNum, int pageSize, int cid) {
        return keyDao.attributeByCid(pageNum,pageSize,cid);
    }

    @Override
    public boolean insertAttr(AttributeKey attributeKey) {
        return keyDao.insertAttr(attributeKey);
    }

    @Override
    public boolean upAttribute(AttributeKey attributeKey) {
        return keyDao.upAttribute(attributeKey);
    }

    @Override
    public boolean delAttrubute(int id) {
        return keyDao.delAttrubute(id);
    }

}
