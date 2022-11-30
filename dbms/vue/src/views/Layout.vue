<template>
  <div>
    <!-- 头部区域  -->
    <div style="height: 60px; line-height: 60px; background-color: white; margin-bottom: 2px; display:flex">
      <div style="width: 400px">
        <img src="@/assets/logo.png" alt=""
             style="width: 40px; position: relative; top: 10px; left: 20px">
        <span style="margin-left: 25px; font-size: 24px; font-family: alimama" v-if="!admin.flag">学生信息与选课管理系统</span>
        <span style="margin-left: 25px; font-size: 24px; font-family: alimama" v-if="admin.flag">学生选课系统</span>
      </div>
      <div style="flex: 1; text-align: right; padding-right: 20px">
        <el-dropdown size="medium">
         <span class="el-dropdown-link" style="cursor: pointer">
           {{ admin.username }}<i class="el-icon-arrow-down el-icon--right"></i>
         </span>
          <el-dropdown-menu slot="dropdown" style="margin-top: -5px">
            <el-dropdown-item>
              <div style="width: 50px; text-align: center;" @click="logout">退出</div>
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>

    <!-- 侧边栏和主体-->
    <div style="display: flex">
      <!-- 侧边栏导航 -->
      <div
          style="width: 200px; min-height: calc(100vh - 62px); overflow: hidden; margin-right: 2px; background-color: white;">
        <!-- :default-openeds="['user', 'admin']"可以设置默认打开的子菜单，等号右边的值是子菜单的index构成的数组 -->
        <el-menu :default-active="$route.path"
                 router class="el-menu-demo">
          <el-menu-item index="/">
            <i class="el-icon-eleme"></i>
            <span>首页</span>
          </el-menu-item>
          <el-submenu index="admin" v-if="!admin.flag">
            <template slot="title">
              <i class="el-icon-user"></i>
              <span>管理员管理</span>
            </template>
            <el-menu-item index="/addAdmin">管理员添加</el-menu-item>
            <el-menu-item index="/adminList">管理员列表</el-menu-item>
          </el-submenu>
          <el-submenu index="student" v-if="!admin.flag" >
            <template slot="title">
              <i class="el-icon-user-solid"></i>
              <span>学生管理</span>
            </template>
            <el-menu-item index="/studentList">学生列表</el-menu-item>
            <el-menu-item index="/addStudent">增加学生</el-menu-item>
          </el-submenu>
          <el-submenu index="course" v-if="!admin.flag">
            <template slot="title">
              <i class="el-icon-s-operation"></i>
              <span>课程管理</span>
            </template>
            <el-menu-item index="/courseList">课程列表</el-menu-item>
            <el-menu-item index="/addCourse">增加课程</el-menu-item>
          </el-submenu>
          <el-submenu index="teacher" v-if="!admin.flag">
            <template slot="title">
              <i class="el-icon-s-check"></i>
              <span>教师管理</span>
            </template>
            <el-menu-item index="/teacherList">教师列表</el-menu-item>
            <el-menu-item index="/addTeacher">增加教师</el-menu-item>
          </el-submenu>
          <el-menu-item index="scList" v-if="!admin.flag">
            <i class="el-icon-files"></i>
            <span>选课情况</span>
          </el-menu-item>
          <el-submenu index="studentSc" v-if="admin.flag">
            <template slot="title">
              <i class="el-icon-s-check"></i>
              <span>选课情况</span>
            </template>
            <el-menu-item index="/studentSc">选课</el-menu-item>
            <el-menu-item index="/myClassList">课表</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>

      <!-- 主体数据 -->
      <div style="flex: 1; background-color: white; padding: 10px">
        <!-- 展示子路由：把子路由嵌在这里 -->
        <router-view/>
      </div>

    </div>
  </div>
</template>

<script>
import Cookies from "js-cookie";

export default {
  name: "Layout.vue",
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get("admin")) : {}
    }
  },
  methods: {
    logout() {
      Cookies.remove('admin');
      this.$router.push('/login');
      // 清除浏览器用户数据

    }
  }
}
</script>

<style scoped>

</style>