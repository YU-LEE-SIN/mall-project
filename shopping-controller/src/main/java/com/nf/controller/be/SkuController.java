package com.nf.controller.be;

import com.github.pagehelper.PageInfo;
import com.nf.entity.AttributeKey;
import com.nf.entity.TbSku;
import com.nf.service.AttributeKeyService;
import com.nf.service.SkuService;
import com.nf.vo.ResponseVO;
import com.nf.vo.SpuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class SkuController {
    @Autowired
    private SkuService skuService;

    @RequestMapping("/addSku")
    @ResponseBody
    public ResponseVO addSku(TbSku tbSku, MultipartFile myFile) throws IOException {
        if (myFile != null) {
            //上传
            tbSku.setImages(upLoad(myFile));
            //保存数据库
            boolean flag = skuService.insertTbSku(tbSku);
            return ResponseVO.newBuilder().code("200").msg("successful").build();
        } else {
            boolean flag = skuService.insertTbSku(tbSku);
            return ResponseVO.newBuilder().code("200").msg("successful").build();
        }
    }

    //上传
    private String upLoad(MultipartFile myFile) throws IOException {
        //保存的地方 MultipartFile myfile
        final String FILE_DIRECTORY = "E:\\Myproject\\shopping-project\\shopping-controller\\" +
                "src\\main\\resources\\static\\images";
        //得到上传过来的文件名
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

    @ResponseBody
    @RequestMapping("skuDelete")
    public ResponseVO sKuDelete(int id){
        boolean flag = skuService.deleteSkuById(id);
        return ResponseVO.newBuilder().code("200").msg("successful").build();

    }
    @RequestMapping("skuList")
    @ResponseBody
    public ResponseVO skyList(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                              @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize) {
        List<TbSku> brandList = skuService.skuList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(brandList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }

    @RequestMapping("skuBySpuId")
    @ResponseBody
    public ResponseVO skuBySpuId(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                 @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize,
                                 int spuId) {
        List<TbSku> brandList = skuService.skuListBySpuId(pageNum, pageSize,spuId);
        PageInfo pageInfo = new PageInfo(brandList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }

}
