<template>
  <div>
    <div style="display: flex; align-content: center; justify-content: center; margin-top: 20px">
      <h1 style="margin-left: 15px;">Welcome！</h1>
      <img src="../../assets/welcome.png" style="width: 60px; height: 60px">
    </div>
    <img src="../../assets/compose.png" style="position: relative;margin-left: 10%;margin-top: 3%;width: 1000px;height: 400px">
    <p style="font-family: alimama; font-size: 25px; margin-top: 50px; text-align: right; margin-right: 100px">—— &nbsp;一款面向学生、教师的信息管理系统</p>
  </div>
</template>

<script>
import Cookies from 'js-cookie'
import request from "@/utils/request";

export default {
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get("admin")) : {}
    }
  },
  created() {
    console.log(this.admin)
  }
}
</script>

<style>
.item {
  margin: 10px 0;
  color: #666;
}
</style>