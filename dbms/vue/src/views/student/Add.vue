<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">新增分类</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="学号" prop="sno">
        <el-input v-model="form.sno" placeholder="请输入学生学号"></el-input>
      </el-form-item>
      <el-form-item label="姓名" prop="sname">
        <el-input v-model="form.sname" placeholder="请输入学生姓名"></el-input>
      </el-form-item>
      <el-form-item label="性别" prop="ssex">
        <el-input v-model="form.ssex" placeholder="请输入学生性别"></el-input>
      </el-form-item>
      <el-form-item label="年龄" prop="sage">
        <el-input v-model="form.sage" placeholder="请输入学生年龄"></el-input>
      </el-form-item>
      <el-form-item label="专业" prop="sdept">
        <el-input v-model="form.sdept" placeholder="请输入学生专业"></el-input>
      </el-form-item>
      <el-form-item label="住址" prop="address">
        <el-input v-model="form.address" placeholder="请输入学生住址"></el-input>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
      <el-input v-model="form.phone" placeholder="请输入学生联系方式"></el-input>
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
      rules: {
        //姓名仅要求为必填
        sno: [
          {required: true, message: '请输入学生学号', trigger: 'blur'},
        ],
        sname: [
          {required: true, message: '请输入学生姓名', trigger: 'blur'},
        ],
        ssex: [
          {required: true, message: '请输入学生性别', trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/student/save', this.form).then(res => {
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