<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">新增分类</div>
    <el-form  :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="课程编号" prop="cno">
        <el-input v-model="form.cno" placeholder="请输入课程编号"  style="width: 200px"></el-input>
      </el-form-item>
      <el-form-item label="课程名称" prop="cname">
        <el-input v-model="form.cname" placeholder="请输入课程名称" style="width: 200px"></el-input>
      </el-form-item>
      <el-form-item label="上课地点">
        <el-select v-model="form.place" placeholder="请选择上课地点">
          <el-option label="文楼" value="文楼"></el-option>
          <el-option label="东三" value="东三"></el-option>
          <el-option label="东二" value="东二"></el-option>
          <el-option label="东一" value="东一"></el-option>
          <el-option label="中楼" value="中楼"></el-option>
          <el-option label="西一" value="西一"></el-option>
          <el-option label="西二" value="西二"></el-option>
          <el-option label="西三" value="西三"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="授课老师">
        <el-select v-model="form.tno" placeholder="请选择上课老师">
          <el-option v-for="(item) in teacher"  :label="item.tname" :value="item.tno" ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="开课时间">
        <el-col :span="11">
          <el-date-picker type="date" placeholder="选择日期" v-model="form.startTime" style="width: 100%;"></el-date-picker>
        </el-col>
      </el-form-item>
      <el-form-item label="结课时间">
        <el-col :span="11">
          <el-date-picker type="date" placeholder="选择日期" v-model="form.endTime" style="width: 100%;"></el-date-picker>
        </el-col>
      </el-form-item>
      <el-form-item label="课程简介">
        <el-input type="textarea" v-model="form.introduction"></el-input>
      </el-form-item>
    </el-form>

    <div style="text-align: center; margin-top: 30px">
      <el-button type="primary" @click="save" size="medium">提交</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: 'AddStudent',
  created() {
    request.get("teacher/list").then(res=>{
      this.teacher=res.data
    })
  },
  data() {
    return {
      form: {},
      teacher:[],
      rules: {
        //姓名仅要求为必填
        cno: [
          {required: true, message: '请输入课程编号', trigger: 'blur'},
        ],
        cname: [
          {required: true, message: '请输入课程名称', trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/course/save', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success('新增成功')
              this.$router.push("courseList");
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    }
  }
}
</script>