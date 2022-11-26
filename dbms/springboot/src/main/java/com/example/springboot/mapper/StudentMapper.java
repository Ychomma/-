package com.example.springboot.mapper;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.entity.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StudentMapper {
    List<Student> list();

    List<Student> listByCondition(Student obj);

    void save(Student student);

    Student getById(String sno);

    void updateById(Student student);

    void deleteById(String sno);
}
