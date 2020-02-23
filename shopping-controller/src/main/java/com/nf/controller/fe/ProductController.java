package com.nf.controller.fe;

import com.github.pagehelper.PageInfo;
import com.nf.entity.TbSku;
import com.nf.entity.TbSpu;
import com.nf.service.SkuService;
import com.nf.service.SpuService;
import com.nf.vo.ResponseVO;
import com.nf.vo.SpuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.List;

@Controller
@RequestMapping("/index")
public class ProductController {
    @Autowired
    private SpuService spuService;
    @Autowired
    private SkuService skuService;

    @ResponseBody
    @RequestMapping("/spuListByCid")
    public ResponseVO spuListByCid(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                               @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize,
                               int cid) {
        List<TbSpu> brandList = spuService.spuListByCid(pageNum, pageSize,cid);
        PageInfo pageInfo = new PageInfo(brandList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/skuListBysId")
    public ResponseVO skuListBysId(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                   @RequestParam(value = "pageSize", defaultValue = "100", required = false) int pageSize,
                                   int spuId) {
        List<TbSku> brandList = skuService.skuListBySpuId(pageNum, pageSize,spuId);
        PageInfo pageInfo = new PageInfo(brandList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }
}
