package com.example.springboot.service;

import com.example.springboot.entity.Student;

import java.util.List;

public interface IStudentService {
    List<Student> list();
    void save(Student obj);

    Student getById(String id);

    void update(Student obj);

    void deleteById(String id);

    List<Student> listByCondition(Student obj);
}
