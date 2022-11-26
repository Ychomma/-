<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">编辑教师信息</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="教师编号" prop="tno">
        <el-input v-model="form.tno" placeholder="请输入教师编号"></el-input>
      </el-form-item>
      <el-form-item label="教师姓名" prop="tname">
        <el-input v-model="form.tname" placeholder="请输入教师姓名"></el-input>
      </el-form-item>
      <el-form-item label="教师联系方式" prop="phone">
        <el-input v-model="form.phone" placeholder="请输入教师联系方式"></el-input>
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
  name: 'EditCourse',
  data() {
    return {
      form: {},
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
  created() {
    const id = this.$route.query.id
    request.get("/teacher/" + id).then(res => {
      console.log(res)
      this.form = res.data
    })
  },
  methods: {
    save() {
      request.post('/course/update', this.form).then(res => {
        if (res.code === '200') {
          this.$notify.success('更新成功')
          //更新成功后返回用户列表界面
          this.$router.push("/courseList")
        } else {
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>