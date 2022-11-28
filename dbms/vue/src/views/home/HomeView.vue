<template>
  <div>
    <h1>Welcome！</h1>
    <img src="../../assets/homeview.png" style="position: relative;margin-left: 25%;margin-top: 5%;width: 600px;height: 368px">
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