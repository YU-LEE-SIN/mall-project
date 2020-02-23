package com.nf.controller.be;

import com.github.pagehelper.PageInfo;
import com.nf.entity.Category;
import com.nf.service.CategoryService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @ResponseBody
    @RequestMapping("/categoryList")
    public ResponseVO categoryList(@RequestParam(value = "pageNum", defaultValue = "1", required = false)int pageNum,
                                   @RequestParam(value = "pageSize", defaultValue="4", required = false)int pageSize) {
        List<Category> categoryList = categoryService.categoryList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(categoryList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/categoryListByName")
    public ResponseVO categoryListByName(@RequestParam(value = "pageNum", defaultValue = "1", required = false)int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "3", required=false)int pageSize,
                                         String categoryName) {
        List<Category> categoryList = categoryService.categoryListByName(pageNum, pageSize,categoryName);
        PageInfo pageInfo = new PageInfo(categoryList,3);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }

    @ResponseBody
    @RequestMapping("/addCategory")
    public ResponseVO categoryInsert(Category category){
        boolean flag = categoryService.insertCategory(category);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/editCategory")
    public ResponseVO categoryUpdate(Category category){
        boolean flag = categoryService.updateCategoryById(category);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/categoryDelete")
    public ResponseVO categoryUpdate(int id){
        boolean flag = categoryService.deleteCategoryById(id);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }
}
