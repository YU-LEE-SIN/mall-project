package com;

import com.nf.service.CategoryService;
import com.nf.entity.Category;
import config.AppConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class CategoryTest {
    @Autowired
    private CategoryService service;
    @Test
    public void getAll(){
        List<Category> result = service.categoryList(1, 4);
        for (Category category : result) {
            System.out.println("category = " + category);
        }
    }
    @Test
    public void insert() {
        Category category = new Category("书集", 0, true, 3);
        boolean flag=service.insertCategory(category);
        System.out.println("flag = " + category.getId());
    }

    @Test
    public void selectName() {
        List<Category> result = service.categoryListByName(1, 3,"手");
        for (Category category : result) {
            System.out.println("category = " + category);
        }
    }

    @Test
    public void deleteById() {
        boolean flag=service.deleteCategoryById(11);
        System.out.println("flag = " + flag);
    }
    @Test
    public void update(){
        Category category = new Category();
        category.setCategoryName("文学书集");
        category.setParentId(12);
        category.setIsParent(false);
        category.setSort(3);
        category.setId(12);
        boolean flag = service.updateCategoryById(category);
        System.out.println("flag = " + flag);
    }
}
