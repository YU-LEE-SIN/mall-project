package com.nf.service;

import com.nf.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> categoryList(int pageNum, int pageSize);
    List<Category> categoryListByName(int pageNum, int pageSize, String categoryName);
    boolean insertCategory(Category category);

    boolean deleteCategoryById(int id);

    boolean updateCategoryById(Category category);
}
