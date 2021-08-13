package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.LocInfoEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LocationDAO {
    List<LocInfoEntity> selectAllInfo();
}
