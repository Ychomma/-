package com.example.springboot.service.impl;

import com.example.springboot.entity.Course;
import com.example.springboot.mapper.CourseMapper;
import com.example.springboot.mapper.ScMapper;
import com.example.springboot.service.ICourseService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Component
@Service
public class CourseService implements ICourseService {
    @Resource
    CourseMapper courseMapper;
    @Resource
    ScMapper scMapper;
    @Override
    public List<Course> list() {
        return courseMapper.list();
    }

    @Override
    public void save(Course obj) {
        courseMapper.save(obj);
    }

    @Override
    public Course getById(String id) {
        return courseMapper.getById(id);
    }

    @Override
    public void update(Course obj) {
        courseMapper.updateById(obj);
    }

    @Override
    public void deleteById(String id) {
        scMapper.deleteByCId(id);
        courseMapper.deleteById(id);
    }

    @Override
    public List<Course> listByCondition(Course obj) {
        return courseMapper.listByCondition(obj);
    }
}
