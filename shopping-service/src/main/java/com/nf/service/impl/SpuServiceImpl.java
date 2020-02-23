package com.nf.service.impl;

import com.nf.dao.TbSpuDao;
import com.nf.entity.TbSpu;
import com.nf.service.SpuService;
import com.nf.vo.SpuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpuServiceImpl implements SpuService {
    @Autowired
    private TbSpuDao spuDao;
    @Override
    public List<SpuVO> spuList(int pageNum, int pageSize) {
        return spuDao.spuList(pageNum, pageSize);
    }

    @Override
    public List<SpuVO> spuListByTitle(int pageNum, int pageSize, String title) {
        return spuDao.spuListByTitle(pageNum, pageSize, title);
    }

    @Override
    public boolean deleteSpuById(int id) {
        return spuDao.deleteSpuById(id);
    }

    @Override
    public boolean insertSpu(TbSpu tbSpu) {
        return spuDao.insertSpu(tbSpu);
    }

    @Override
    public boolean updateSpu(TbSpu tbSpu) {
        return spuDao.updateSpuById(tbSpu);
    }

    @Override
    public List<TbSpu> spuListByCid(int pageNum, int pageSize, int cid) {
        return spuDao.spuListByCid(pageNum, pageSize, cid);
    }

    @Override
    public List<TbSpu> spuAll() {
        return spuDao.spuAll();
    }

}
