<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">编辑教师信息</div>
    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="教师编号" style="width: 200px">
        <el-input v-model="form.tno" disabled></el-input>
      </el-form-item>
      <el-form-item label="教师姓名">
        <el-input v-model="form.tname" style="width: 200px" placeholder="请输入教师姓名"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email" style="width: 200px" placeholder="请输入教师邮箱"></el-input>
      </el-form-item>
      <el-form-item label="联系方式">
        <el-input v-model="form.phone" style="width: 200px" placeholder="请输入教师联系方式"></el-input>
      </el-form-item>
      <el-form-item label="教师介绍">
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