package com.company.util;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class YijuUtil {
    public static void main(String[] args) {
//        String local="C:\\Users\\Administrator\\Desktop\\edit.png";
//        upload(local,getPicName());
    }
    public static String getPicName(){
        SimpleDateFormat sf=new SimpleDateFormat("yyyyMMdd");
        String picName=sf.format(new Date())+ UUID.randomUUID().toString();
        return picName;
    }
    public static void upload(byte[] file,String upload){
        final String  AK="MUMTwMIxf0HoyoRAcL2jTkSAsTQEnvx5BaTUE3vh";
        final String  SK="enucDs4uVeoAB02SA4nUw37t8CL6Ji_M2GSz5Gir";
        final String BUCKET="7777qwer";

        Configuration cfg=new Configuration(Zone.zone2()) ;
        UploadManager uploadManager=new UploadManager(cfg);
        Auth auth= Auth.create(AK,SK);
        String uptake = auth.uploadToken(BUCKET);
        try {
            Response response = uploadManager.put(file, upload, uptake);
            System.out.println(response);
        } catch (QiniuException e) {
            e.printStackTrace();
        }
    }
}

