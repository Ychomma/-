package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.Sc;
import com.example.springboot.entity.Union;
import com.example.springboot.service.IScService;
import com.example.springboot.service.IUnionService;
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
}
