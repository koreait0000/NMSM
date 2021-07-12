package com.example.nmsm.dao;

import com.example.nmsm.model.DogInfoEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DogInfoDAO {

    List<DogInfoEntity> selectDogInfoByUpk(int u_pk);
}
