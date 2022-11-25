package com.example.springboot.entity;

import lombok.Data;

@Data
public class ScList extends Sc{
    Course course;
    Student student;
    Teacher teacher;
}
