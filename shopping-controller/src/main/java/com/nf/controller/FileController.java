package com.nf.controller;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.UUID;

@Controller
public class FileController {
    //保存的地方
    public static final String FILE_DIRECTORY ="E:\\Myproject\\shopping-project\\shopping-controller\\" +
            "src\\main\\resources\\static\\images";
    @RequestMapping("/upload")//上传
    private String upLoad(MultipartFile myFile) throws IOException {
        //得到上传过来的文件名
        String filename = myFile.getOriginalFilename();
        // 拆成  xx.jpg--xxx.png
        String fileExt = filename.substring(filename.lastIndexOf("."));
        //改图片名
        String image = UUID.randomUUID().toString() + fileExt;
        //文件路径
        String path = FILE_DIRECTORY + File.separator + image;
        File file = new File(path);
        //把文件上传到File（路径）
        myFile.transferTo(file);
        return "ok";
    }

    @RequestMapping("/download")//下载
    public ResponseEntity<InputStreamSource> download(String filename) throws IOException {
        //在mac系统下pathSeparator值为: ,separator值为: /
        String fullPath = FILE_DIRECTORY + File.separator + filename;

        File file = new File(fullPath);
        //这个guess方法是依据文件名来得到媒体类型也就是mime类型,
        // 比如常见有image/jpeg,application/json
        String mediaType = URLConnection.guessContentTypeFromName(filename);
        if(mediaType==null) {
            /*识别不了时,统统用这个,一般用来表示下载二进制数据*/
            mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }
        System.out.println("-----debug: mediaType = " + mediaType);
        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(MediaType.parseMediaType(mediaType));

        //attachment :附件的意思,表示告诉浏览器弹出一个另存为窗口来下载文件,
        // inline是直接在浏览器中打开下载的文件
        //需要进行URL编码处理,否则另存为对话框不能显示中文
        respHeaders.setContentDispositionFormData("attachment",
                URLEncoder.encode(filename,"UTF-8"));
        InputStreamResource isr =
                new InputStreamResource(new FileInputStream(file));
        return new ResponseEntity<>(isr, respHeaders, HttpStatus.OK);
    }
}
