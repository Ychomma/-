<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">编辑分类</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="学号" prop="sno">
        <el-input v-model="form.sno" placeholder="请输入学生学号" disabled></el-input>
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
        <el-input v-model="form.sdept" placeholder="请输入专业"></el-input>
      </el-form-item>
      <el-form-item label="住址" prop="address">
        <el-input v-model="form.address" placeholder="请输入住址"></el-input>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
        <el-input v-model="form.phone" placeholder="请输入联系方式"></el-input>
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
  name: 'EditCategory',
  data() {
    return {
      form: {},
      rules: {
        //姓名仅要求为必填
        name: [
          {required: true, message: '请输入分类名称', trigger: 'blur'},
        ],
      }
    }
  },
  created() {
    const id = this.$route.query.id
    request.get("/student/" + id).then(res => {
      console.log(res)
      this.form = res.data
    })
  },
  methods: {
    save() {
      request.post('/student/update', this.form).then(res => {
        if (res.code === '200') {
          this.$notify.success('更新成功')
          //更新成功后返回用户列表界面
          this.$router.push("/studentList")
        } else {
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>