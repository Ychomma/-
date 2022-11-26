package com.example.springboot.mapper;

import com.example.springboot.entity.Union;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UnionMapper {
    List<Union> list();
    List<Union>listByCondition(Union obj);
}
