package com.example.nmsm.dyn.service;

import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.dyn.dao.DogInfoDAO;
import com.example.nmsm.sta.model.DogBreedEntity;
import com.example.nmsm.sta.model.DogInfoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class DogInfoService extends CommonService{

    @Autowired
    private DogInfoDAO dogInfoDAO;

    public List<DogInfoEntity> getDogInfo(PrincipalDetails principalDetails){

        return dogInfoDAO.selectDogInfoByUpk(getIuser(principalDetails));
    }

    public List<DogBreedEntity> getDogBreed(){
        List<DogBreedEntity> list = dogInfoDAO.selectAllDogBreed();
        return list;
    }

    public void registMyDog(DogInfoEntity dogInfoEntity,
                            MultipartFile multipartFile,
                            PrincipalDetails principalDetails){
        int iuser = getIuser(principalDetails);
        String baseDir = makeDir("dog/"+iuser);
        saveFile(baseDir,iuser+".jpg",multipartFile);
        dogInfoEntity.setIuser(iuser);
        dogInfoDAO.insertDogInfo(dogInfoEntity);

    }
}
