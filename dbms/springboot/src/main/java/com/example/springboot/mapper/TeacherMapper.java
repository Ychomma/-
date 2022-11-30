package com.example.springboot.mapper;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.entity.ExtraCourse;
import com.example.springboot.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeacherMapper {
    List<Teacher> list();

    void save(Teacher teacher);

    Teacher getById(String tno);

    void updateById(Teacher teacher);

    void deleteById(String tno);
    List<Teacher>listByCondition(Teacher obj);
}
