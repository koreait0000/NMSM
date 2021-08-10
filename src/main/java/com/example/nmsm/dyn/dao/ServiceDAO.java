package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.ServiceEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ServiceDAO {
    List<ServiceEntity> selectAllInfo();
}
