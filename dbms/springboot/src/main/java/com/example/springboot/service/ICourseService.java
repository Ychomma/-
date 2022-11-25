package com.example.springboot.service;

import com.example.springboot.entity.Course;

import java.util.List;

public interface ICourseService {
    List<Course> list();
    void save(Course obj);

    Course getById(String id);

    void update(Course obj);

    void deleteById(String id);
}
