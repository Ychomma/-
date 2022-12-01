package com.example.springboot.mapper;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.entity.Course;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface CourseMapper {
    List<Course> list();

    List<Course> listByCondition(Course obj);

    void save(Course course);

    Course getById(String cno);

    void updateById(Course course);

    void deleteById(String cno);
    void endSelect(Course course);
}
