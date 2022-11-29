<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">编辑教师信息</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="教师编号" prop="tno">
        <el-input v-model="form.tno" placeholder="请输入教师编号" disabled></el-input>
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
  name: 'EditCourse',
  data() {
    return {
      form: {},
      rules: {
        //姓名仅要求为必填
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
    }
  },
  created() {
    const id = this.$route.query.id
    request.get("/teacher/" + id).then(res => {
      this.form = res.data
      request.get("/course/"+this.form.cno).then(res=>{
        console.log(res)
        if(res.data!=null) {
          this.form.cname = res.data.cname
          this.$forceUpdate()
        }
      })
    })

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
      request.post('/teacher/update', this.form).then(res => {
        if (res.code === '200') {
          this.$notify.success('更新成功')
          //更新成功后返回用户列表界面
          this.$router.push("/teacherList")
        } else {
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>