package com.nf.controller.fe;

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
@RequestMapping("/index")
public class CateGoryController {
    @Autowired
    private CategoryService categoryService;
    @ResponseBody
    @RequestMapping("/categoryList")
    public ResponseVO categoryList(@RequestParam(value = "pageNum", defaultValue = "1", required = false)int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "10", required=false)int pageSize) {
        List<Category> categoryList = categoryService.categoryList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(categoryList,3);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }

}
