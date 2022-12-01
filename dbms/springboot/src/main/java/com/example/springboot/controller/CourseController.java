package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.Course;
import com.example.springboot.entity.ExtraCourse;
import com.example.springboot.service.ICourseService;
import com.example.springboot.service.IScService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin //解决跨域问题
@RestController
@RequestMapping("/course")
public class CourseController {
    @Resource
    ICourseService courseService;
    @Resource
    IScService scService;

    @GetMapping("/list")
    public Result List(){
        List<Course> list=courseService.list();
        return Result.success(list);
    }
    @PostMapping("/save")
    public Result save(@RequestBody Course obj){
        courseService.save(obj);
        return Result.success();
    }
    @PostMapping("update")
    public Result update(@RequestBody Course obj){
        courseService.update(obj);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable String id){
        scService.deleteByCId(id);
        courseService.deleteById(id);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getById(@PathVariable String id){
        Course course = courseService.getById(id);
        return Result.success(course);
    }

    @PostMapping("/listbycondition")
    public Result listByCondition(@RequestBody Course obj){
        List<Course> list = courseService.listByCondition(obj);
        return Result.success(list);
    }
    @PostMapping("/endselect")
    public Result endSelect(@RequestBody Course obj){
        courseService.endSelect(obj);
        return Result.success();
    }
}
