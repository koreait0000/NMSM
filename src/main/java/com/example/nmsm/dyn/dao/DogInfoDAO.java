package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.DogBreedEntity;
import com.example.nmsm.sta.model.DogInfoEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DogInfoDAO {
    List<DogInfoEntity> selectDogInfoByUpk(int u_pk);
    List<DogBreedEntity> selectAllDogBreed();

    void insertDogInfo(DogInfoEntity dogInfoEntity);
}
