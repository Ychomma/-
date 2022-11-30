<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">编辑学生信息</div>
    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="学号">
        <el-input v-model="form.sno" style="width: 200px" disabled></el-input>
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
  name: 'EditCategory',
  data() {
    return {
      imageUrl:'',
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
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    }
  }
}
</script>
<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>