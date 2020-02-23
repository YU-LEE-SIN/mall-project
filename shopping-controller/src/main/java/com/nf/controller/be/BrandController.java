package com.nf.controller.be;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.nf.entity.Brand;
import com.nf.service.BrandService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@RequestMapping("/admin")
@Controller
public class BrandController {
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

    @PostMapping("/deleteBrand")
    @ResponseBody
    public ResponseVO deleteBrand(int id) {
        //先删品牌和类目关系表，在删品牌表。
        boolean flag = brandService.deleteBrandById(id);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }

    @PostMapping("/addBrand")
    @ResponseBody
    public ResponseVO insertBrand(Brand brand,MultipartFile myFile) throws IOException {
        String image = upLoad(myFile);
        //保存数据库
        brand.setBrandImage(image);
        boolean flag = brandService.insertBrand(brand);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
    }

    @PostMapping("/editBrand")
    @ResponseBody
    public ResponseVO updateBrand(Brand brand,MultipartFile myFile) throws IOException {
        if (myFile != null) {
            //上传
            String image = upLoad(myFile);
            //保存数据库
            brand.setBrandImage(image);
            boolean flag = brandService.updateBrandById(brand);
            return ResponseVO.newBuilder().code("200").msg("successful").build();
        } else {
            boolean flag = brandService.updateBrandById(brand);
            return ResponseVO.newBuilder().code("200").msg("successful").build();
        }
    }
    //条件查询
    @PostMapping("/brandListByName")
    @ResponseBody
    public ResponseVO brandListByName(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                    @RequestParam(value = "pageSize", defaultValue = "3", required = false) int pageSize,
                                    String brandName) {
        List<Brand> result = brandService.brandListByName(pageNum, pageSize, brandName);
        PageInfo pageInfo = new PageInfo(result, 3);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }


    //上传
    private String upLoad(MultipartFile myFile) throws IOException {
        //保存的地方 MultipartFile myfile
         final String FILE_DIRECTORY = "E:\\Myproject\\shopping-project\\shopping-controller\\" +
                "src\\main\\resources\\static\\images";
        String filename = myFile.getOriginalFilename();
        // 拆成  xx.jpg--xxx.png
        String fileExt = filename.substring(filename.lastIndexOf("."));
        //改图片名
        String image = UUID.randomUUID().toString() + fileExt;
        //文件路径
        String path = FILE_DIRECTORY + File.separator + image;
        //File file = new File(path);
        //把文件上传到File（路径）
        //myFile.transferTo(file);
        return image;
    }
}