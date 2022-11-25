package com.example.springboot.mapper;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeacherMapper {
    List<Teacher> list();

    List<Teacher> listByCondition(BaseRequest baseRequest);

    void save(Teacher teacher);

    Teacher getById(String tno);

    void updateById(Teacher teacher);

    void deleteById(String tno);
}
