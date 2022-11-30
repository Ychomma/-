<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">新增学生</div>
    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="学号">
        <el-input v-model="form.sno" style="width: 200px" ></el-input>
      </el-form-item>
      <el-form-item label="学生姓名">
        <el-input v-model="form.sname"style="width: 200px"></el-input>
      </el-form-item>
      <el-form-item label="专业">
        <el-select v-model="form.sdept" placeholder="请选择学生专业">
          <el-option label="计算机科学与技术" value="计算机科学与技术"></el-option>
          <el-option label="电气工程与自动化" value="电气工程与自动化"></el-option>
          <el-option label="人工智能" value="人工智能"></el-option>
          <el-option label="大数据" value="大数据"></el-option>
          <el-option label="信息安全" value="信息安全"></el-option>
          <el-option label="心理学" value="心理学"></el-option>
          <el-option label="会计学" value="会计学"></el-option>
          <el-option label="法学" value="法学"></el-option>
          <el-option label="经济学" value="经济学"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="学生性别">
        <el-radio-group v-model="form.ssex">
          <el-radio label="男"></el-radio>
          <el-radio label="女"></el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="学生年龄">
        <el-input v-model="form.sage"style="width: 200px"></el-input>
      </el-form-item>
      <el-form-item label="入学年月">
        <el-col :span="11">
          <el-date-picker type="date" placeholder="选择日期" v-model="form.schoolTime" style="width: 100%;"></el-date-picker>
        </el-col>
      </el-form-item>
      <el-form-item label="联系方式">
        <el-input v-model="form.phone" style="width: 200px" ></el-input>
      </el-form-item>

      <el-form-item label="住址">
        <el-input type="textarea" v-model="form.address"></el-input>
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
          request.post('/student/save', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success('新增成功')
              this.$router.push("/studentList")
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
  }
}
</script>