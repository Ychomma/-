<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="根据课程名查询" v-model="params.cname"></el-input>
      <el-input style="width: 240px" placeholder="根据教师查询" v-model="params.tname"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="search"><i class="el-icon-search">搜索</i></el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh">重置</i></el-button>
    </div>
    <!-- 表格 -->
    <el-table :data="tableData" stripe  row-key="id" default-expand-all>
      <el-table-column prop="cno" label="课程编号" ></el-table-column>
      <el-table-column prop="cname" label="课程名称"></el-table-column>
      <el-table-column prop="tno" label="授课老师编号"></el-table-column>
      <el-table-column prop="tname" label="授课老师"></el-table-column>
      <el-table-column prop="phone" label="联系方式"></el-table-column>
      <el-table-column prop="grade" label="成绩"></el-table-column>
    </el-table>
    <!-- 分页 -->
    <div style="margin-top: 20px">
      <el-pagination
          background
          :current-page="params.pageNum"
          :page-size="params.pageSize"
          layout="prev, pager, next"
          @current-change="handleCurrentChange"
          :total="total">
      </el-pagination>
    </div>
  </div>
</template>


<script>
import request from "@/utils/request";
import Cookies from "js-cookie";

export default {
  name: 'MyClassList',
  data() {
    return {
      tableData: [],
      total: 0,
      dialogFormVisible:false ,
      admin: Cookies.get("admin") ? JSON.parse(Cookies.get('admin')) : {},
      params: {
      },
      pid:null,
      findData:[],
      form:{
        cno:{},
        sno:{},
        grade:{}
      },
    }
  },

  created() {
    this.load();
  },
  methods: {
    load() {
      request.post("/sc/mySclist", this.admin.sno).then(res=>{
        console.log(res)
        if (res.code === '200') {
          this.tableData = res.data
          this.total = res.data.total
        }
      })
    },
    reset() {
      this.params = {
        sno:null,
        cno:null,
      }
      this.load()
    },
    search(){
      this.findData=[];
      if(this.params.cname==null&&this.params.tname==null) return;
      if(this.params.cname!=null&&this.params.tname==null){
        this.tableData.forEach(data=>{
          if(data.cname===this.params.cname){
            this.findData.push(data);
          }
        })
      }
      else if(this.params.cname==null&&this.params.tname!=null) {
        this.tableData.forEach(data=>{
          if(data.tname===this.params.tname){
            this.findData.push(data);
          }
        })
      }else{
        this.tableData.forEach(data=>{
          if(data.tname===this.params.tname && data.cname===this.params.cname){
            this.findData.push(data);
          }
        })
      }
      this.tableData=this.findData
    },
    handleCurrentChange(pageNum) {
      //点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    }
  }
}
</script>

<style scoped>

</style>