package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.Student;
import com.example.springboot.service.IStudentService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin //解决跨域问题
@RestController
@RequestMapping("/student")
public class StudentController {
    @Resource
    IStudentService studentService;

    @GetMapping("/list")
    public Result List(){
        List<Student> list=studentService.list();
        System.out.println(Result.success(list));
        return Result.success(list);
    }
    @PostMapping("/save")
    public Result save(@RequestBody Student obj){
        studentService.save(obj);
        return Result.success();
    }
    @PostMapping("update")
    public Result update(@RequestBody Student obj){
        studentService.update(obj);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable String sno){
        studentService.deleteById(sno);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getById(@PathVariable String sno){
        Student student = studentService.getById(sno);
        return Result.success(student);
    }

}
