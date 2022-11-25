package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.Teacher;
import com.example.springboot.service.ITeacherService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin //解决跨域问题
@RestController
@RequestMapping("/teacher")
public class TeacherController {
    @Resource
    ITeacherService teacherService;

    @GetMapping("/list")
    public Result List(){
        List<Teacher> list=teacherService.list();
        return Result.success(list);
    }
    @PostMapping("/save")
    public Result save(@RequestBody Teacher obj){
        teacherService.save(obj);
        return Result.success();
    }
    @PostMapping("update")
    public Result update(@RequestBody Teacher obj){
        teacherService.update(obj);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable String id){
        teacherService.deleteById(id);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getById(@PathVariable String id){
        Teacher teacher = teacherService.getById(id);
        return Result.success(teacher);
    }

}
