package com.example.springboot.service;

import com.example.springboot.entity.Teacher;

import java.util.List;

public interface ITeacherService {
    List<Teacher> list();
    void save(Teacher obj);

    Teacher getById(String id);

    void update(Teacher obj);

    void deleteById(String id);
}
