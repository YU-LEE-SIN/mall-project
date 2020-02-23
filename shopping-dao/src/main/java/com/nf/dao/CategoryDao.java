package com.nf.dao;

import com.nf.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryDao {
    List<Category> categoryList(@Param("pageNum") int pageNum,
                                @Param("pageSize") int pageSize);

    List<Category>categoryListByName(@Param("pageNum") int pageNum,
                                     @Param("pageSize") int pageSize,
                                     @Param("categoryName")String categoryName);

    boolean insertCategory(Category category);

    boolean deleteCategoryById(int id);

    boolean updateCategoryById(Category category);
}
