<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">新增教师</div>
    <el-form :rules="rules" ref="ruleForm" :model="form" label-width="80px">
      <el-form-item label="教师编号" prop="tno" >
        <el-input v-model="form.tno" placeholder="请输入教师编号" style="width: 200px"></el-input>
      </el-form-item>
      <el-form-item label="教师姓名" prop="tname">
        <el-input v-model="form.tname" style="width: 200px" placeholder="请输入教师姓名"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="form.email" style="width: 200px" placeholder="请输入教师邮箱"></el-input>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
        <el-input v-model="form.phone" style="width: 200px" placeholder="请输入教师联系方式"></el-input>
      </el-form-item>
      <el-form-item label="教师介绍" prop="introduction">
        <el-input v-model="form.introduction" style="width: 200px" placeholder="请输入教师介绍的链接"></el-input>
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
  data() {
    return {
      form: {},
      course:[],
      rules: {
        //姓名仅要求为必填
        tno: [
          {required: true, message: '请输入教师编号', trigger: 'blur'},
        ],
        tname: [
          {required: true, message: '请输入教师姓名', trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    findCourse(){
      request.get("/course/"+this.form.cno).then(res=>{
        this.form.cname=null;
        if(res.data!==null) {
          this.form.cname = res.data.cname
          this.$forceUpdate()
        }
      })
    },
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/teacher/save', {
            cno:this.form.cno,
            tno:this.form.tno,
            tname:this.form.tname,
            phone:this.form.phone,
          }).then(res => {
            if (res.code === '200') {
              this.$notify.success('新增成功')
              //提交成功后清空表单
              // this.form = {sex: '男'}
              this.$refs['ruleForm'].resetFields()
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