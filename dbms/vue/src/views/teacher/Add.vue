<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">新增教师</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="教师编号" prop="tno">
        <el-input v-model="form.tno" placeholder="请输入教师编号"></el-input>
      </el-form-item>
      <el-form-item label="教师姓名" prop="tname">
        <el-input v-model="form.tname" placeholder="请输入教师姓名"></el-input>
      </el-form-item>
      <el-form-item label="授课课程编号" prop="cno">
        <el-input v-model="form.cno" placeholder="请输入课程编号" @blur="findCourse()"></el-input>
      </el-form-item>
      <el-form-item label="授课课程号名称" prop="cname">
        <el-input v-model="form.cname" placeholder="该课程不存在" disabled></el-input>
      </el-form-item>
      <el-form-item label="教师联系方式" prop="phone">
        <el-input v-model="form.phone" placeholder="请输入教师联系方式" ></el-input>
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
        cno: [
          {required: true, message: '请输入课程编号', trigger: 'blur'},
        ],
        tno: [
          {required: true, message: '请输入教师编号', trigger: 'blur'},
        ],
        tname: [
          {required: true, message: '请输入教师姓名', trigger: 'blur'},
        ],
        cname: [
          {required: true, message: '该课程不存在', trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    findCourse(){
      request.get("/course/"+this.form.cno).then(res=>{
        this.form.cname=null;
        if(res.data!=null) {
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