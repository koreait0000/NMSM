package com.example.nmsm.dyn.service;


import com.example.nmsm.dyn.dao.ServiceDAO;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class CommonService {
    @Autowired
    protected ServiceDAO serviceDAO;

    private final String DEFAULT_PATH = "D:/nmsm/";

    public int getIuser(PrincipalDetails principalDetails){
        int num = principalDetails.getUserEntity().getIuser();
        System.out.println("내 정보는 : "+num);
        return num;
    }

    public String makeDir(String path){
        String result = DEFAULT_PATH+path;
        File folder = new File(result);
        folder.mkdir();
        return result;
    }

    public String saveFile(String baseDir, String fileName, MultipartFile multipartFile){
        File saveFile = new File(baseDir,fileName);
        try {
            multipartFile.transferTo(saveFile);
        } catch (IOException e) {
            System.out.printf("저장 실패 : "+baseDir+fileName);
        }
        return saveFile.getPath();
    }


}
