package com.nf.service.impl;

import com.nf.dao.CategoryAndBrandDao;
import com.nf.service.CategoryService;
import com.nf.dao.CategoryDao;
import com.nf.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private CategoryAndBrandDao categoryAndBrandDao;

    @Override
    public List<Category> categoryList(int pageNum, int pageSize) {
        return categoryDao.categoryList(pageNum, pageSize);
    }

    @Override
    public List<Category> categoryListByName(int pageNum, int pageSize, String categoryName) {
        return categoryDao.categoryListByName(pageNum, pageSize,categoryName);
    }

    @Override
    public boolean insertCategory(Category category) {
        categoryDao.insertCategory(category);
        return true;
    }

    @Override
    public boolean deleteCategoryById(int id) {
        return categoryDao.deleteCategoryById(id);
    }

    @Override
    public boolean updateCategoryById(Category category) {
        return categoryDao.updateCategoryById(category);
    }
}
