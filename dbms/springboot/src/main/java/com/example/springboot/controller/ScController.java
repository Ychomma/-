package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.*;
import com.example.springboot.mapper.TeacherMapper;
import com.example.springboot.service.IScService;
import com.example.springboot.service.IStudentSc;
import com.example.springboot.service.IUnionService;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin //解决跨域问题
@RestController
@RequestMapping("/sc")
public class ScController {
    @Resource
    IScService scService;
    @Resource
    IUnionService unionService;
    @Resource
    TeacherMapper teacherMapper;
    @Resource
    IStudentSc studentSc;
    @GetMapping("/list")
    public Result List(){
        Result list = unionService.list();
        return Result.success(list);
    }
    @PostMapping("/save")
    public Result save(@RequestBody Sc obj){
        scService.save(obj);
        return Result.success();
    }
    @PostMapping("update")
    public Result update(@RequestBody Sc obj){
        scService.update(obj);
        return Result.success();
    }
    @DeleteMapping("/delete_Sid/{id}")
    public Result deleteBySId(@PathVariable String id){
        scService.deleteBySId(id);
        return Result.success();
    }
    @DeleteMapping("/delete_Cid/{id}")
    public Result deleteByCId(@PathVariable String id){
        scService.deleteByCId(id);
        return Result.success();
    }
    @GetMapping("getsid/{sid}")
    public Result getBySId(@PathVariable String sid){
        List<Sc> sc = scService.getBySId(sid);
        return Result.success(sc);
    }
    @GetMapping("getcid/{cid}")
    public Result getByCId(@PathVariable String cid){
        List<Sc> sc = scService.getByCId(cid);
        return Result.success(sc);
    }
    @PostMapping("/listbycondition")
    public Result listByCondition(@RequestBody Union obj){
        Result list = unionService.listByCondition(obj);
        return Result.success(list);
    }
    @PostMapping("/studentSclist")
    public Result studentSclist(@RequestBody String sno){
        List<StudentSc> list= studentSc.list(sno);
        for(StudentSc obj:list){
            String tno= obj.getTno();
            Teacher teacher=teacherMapper.getById(tno);
            obj.setTeacherIntroduction(teacher.getIntroduction());
        }
        return Result.success(list);
    }
    @PostMapping("/mySclist")
    public Result mySclist(@RequestBody String sno){
        List<StudentSc> list= studentSc.MyScList(sno);
        return Result.success(list);
    }
    @PostMapping("/delete")
    public Result Delete(@RequestParam String cno,String sno,String tno){
        scService.delete(cno, sno, tno);
        return Result.success();
    }
    @PostMapping("/studentScByCondition")
    public Result studentScByCondition(@RequestBody StudentSc obj)
    {
        return Result.success(studentSc.ScListByCondition(obj));
    }
}
