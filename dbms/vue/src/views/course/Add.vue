<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">新增分类</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="课程编号" prop="cno">
        <el-input v-model="form.cno" placeholder="请输入课程编号"></el-input>
      </el-form-item>
      <el-form-item label="课程名称" prop="cname">
        <el-input v-model="form.cname" placeholder="请输入课程名称"></el-input>
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