package com.nf.controller.fe;

import com.github.pagehelper.PageInfo;
import com.nf.entity.Brand;
import com.nf.service.BrandService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/index")
public class BrandBeController {
    @Autowired
    private BrandService brandService;

    @ResponseBody
    @RequestMapping("/brandList")
    public ResponseVO brandList(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize) {
        List<Brand> brandList = brandService.brandList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(brandList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }
}
