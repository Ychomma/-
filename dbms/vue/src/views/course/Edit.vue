<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">编辑课程</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="课程编号" prop="cno">
        <el-input v-model="form.cno" placeholder="请输入课程编号" disabled></el-input>
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
  name: 'EditCourse',
  data() {
    return {
      form: {},
      rules: {
        //姓名仅要求为必填
        cname: [
          {required: true, message: '请输入课程名称', trigger: 'blur'},
        ],
      }
    }
  },
  created() {
    const id = this.$route.query.id
    request.get("/course/" + id).then(res => {
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