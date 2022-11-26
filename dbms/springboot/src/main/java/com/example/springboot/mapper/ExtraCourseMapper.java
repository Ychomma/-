package com.example.springboot.mapper;

import com.example.springboot.entity.ExtraCourse;
import com.example.springboot.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExtraCourseMapper {
    List<ExtraCourse> list();

    List<ExtraCourse> listByCondition(ExtraCourse obj);
}
