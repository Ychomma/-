package com.example.springboot.mapper;

import com.example.springboot.entity.Sc;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ScMapper {
    List<Sc> list();

    void save(Sc obj);

    List<Sc> getByCId(String id);

    List<Sc> getBySId(String id);

    void updateGrade(Sc obj);

    void deleteBySId(String id);
    void deleteByCId(String id);
}
