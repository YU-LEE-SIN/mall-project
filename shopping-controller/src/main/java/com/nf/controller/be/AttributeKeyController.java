package com.nf.controller.be;

import com.github.pagehelper.PageInfo;
import com.nf.entity.AttributeKey;
import com.nf.entity.Brand;
import com.nf.service.AttributeKeyService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AttributeKeyController {
    @Autowired
    private AttributeKeyService service;
    @ResponseBody
    @RequestMapping("attributeList")
    private ResponseVO attributeList(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                     @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize) {
        List<AttributeKey> brandList = service.attributeList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(brandList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/attributeByCid")
    public ResponseVO attributeByCid(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                     @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize,
                                     int cid) {
        List<AttributeKey> brandList = service.attributeByCid(pageNum, pageSize,cid);
        PageInfo pageInfo = new PageInfo(brandList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }

    @ResponseBody
    @RequestMapping("/addAttr")
    public ResponseVO addAttr(AttributeKey attributeKey) {
        boolean flag = service.insertAttr(attributeKey);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/editAttr")
    public ResponseVO editAttr(AttributeKey attributeKey) {
        boolean flag = service.upAttribute(attributeKey);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/delAttr")
    public ResponseVO delAttr(int id) {
        boolean flag = service.delAttrubute(id);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }
}
