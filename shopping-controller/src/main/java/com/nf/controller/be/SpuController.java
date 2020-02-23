package com.nf.controller.be;

import com.github.pagehelper.PageInfo;
import com.nf.entity.Brand;
import com.nf.entity.TbSpu;
import com.nf.service.SpuService;
import com.nf.vo.ResponseVO;
import com.nf.vo.SpuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class SpuController {
    @Autowired
    private SpuService spuService;

    @ResponseBody
    @RequestMapping("/spuList")
    public ResponseVO brandList(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize) {
        List<SpuVO> spuList = spuService.spuList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(spuList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }
    @ResponseBody
    @RequestMapping("/spuListByTitle")
    public ResponseVO spuListByTitle(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize,
                                     String title) {
        List<SpuVO> spuList = spuService.spuListByTitle(pageNum, pageSize,title);
        PageInfo pageInfo = new PageInfo(spuList, 4);
        return ResponseVO.newBuilder().data(pageInfo).code("200").msg("successful").build();
    }

    @RequestMapping("/spuDelete")
    @ResponseBody
    public ResponseVO deleteSpuById(int id) {
        boolean flag = spuService.deleteSpuById(id);
        return ResponseVO.newBuilder().code("200").msg("del successful").build();
    }
    @RequestMapping("/addSpu")
    @ResponseBody
    public ResponseVO addSpu(TbSpu tbSpu,MultipartFile myFile ) throws IOException {
        //保存数据库
        tbSpu.setImage(upLoad(myFile));
        boolean flag = spuService.insertSpu(tbSpu);
        return ResponseVO.newBuilder().code("200").msg("successful").build();
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

    @RequestMapping("/editSpu")
    @ResponseBody
    public ResponseVO editSpu(TbSpu tbSpu,MultipartFile myFile ) throws IOException {
        if (myFile != null) {
            //上传
            String image = upLoad(myFile);
            //保存数据库
            tbSpu.setImage(image);
            boolean flag = spuService.updateSpu(tbSpu);
            return ResponseVO.newBuilder().code("200").msg("successful").build();
        } else {
            boolean flag = spuService.updateSpu(tbSpu);
            return ResponseVO.newBuilder().code("200").msg("successful").build();
        }
    }

    @ResponseBody
    @RequestMapping("/spuAll")
    public ResponseVO editSpu() {
        List<TbSpu> spuList = spuService.spuAll();
        return ResponseVO.newBuilder().data(spuList).code("200").msg("successful").build();
    }
}
