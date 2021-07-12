package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.DogInfoEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DogInfoDAO {

    List<DogInfoEntity> selectDogInfoByUpk(int u_pk);
}
