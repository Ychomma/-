<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="根据课程名称查询" v-model="params.cname"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="search"><i class="el-icon-search">搜索</i></el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh">重置</i></el-button>
    </div>
    <!-- 表格 -->
    <el-table :data="tableData.slice((params.pageNum-1)*params.pageSize,params.pageNum*params.pageSize)" stripe  :default-sort = "{prop: 'cno'}">
      <el-table-column type="expand" >
      <template slot-scope="props">
        <el-form label-position="left" inline class="demo-table-expand">
          <el-form-item label="课程编号">
            <span>{{ props.row.cno }}</span>
          </el-form-item>
          <el-form-item label="课程">
            <span>{{ props.row.cname }}</span>
          </el-form-item>
          <el-form-item label="课程简介" style="width: 100%">
            <span>{{ props.row.introduction }}</span>
          </el-form-item>
          <el-form-item label="开课时间">
            <span>{{ props.row.startTime }}</span>
          </el-form-item>
          <el-form-item label="结课时间">
            <span>{{ props.row.endTime }}</span>
          </el-form-item>
          <el-form-item label="教师编号">
            <span>{{ props.row.tno }}</span>
          </el-form-item>
          <el-form-item label="教师姓名">
            <span>{{ props.row.tname }}</span>
          </el-form-item>
          <el-form-item label="联系方式">
            <span>{{ props.row.phone }}</span>
          </el-form-item>
          <el-form-item label="教师主页" style="width: 100%">
            <div>
              <el-link :herf=props.row.teacherIntroduction>{{props.row.teacherIntroduction}}</el-link>
            </div>
          </el-form-item>
        </el-form>
      </template>
      </el-table-column>
      <el-table-column prop="cno" label="课程编号" sortable></el-table-column>
      <el-table-column prop="cname" label="课程名称"></el-table-column>
      <el-table-column prop="startTime" label="开课时间"></el-table-column>
      <el-table-column prop="endTime" label="结课时间"></el-table-column>
      <el-table-column prop="tno" label="授课老师编号"></el-table-column>
      <el-table-column prop="tname" label="授课老师" sortable></el-table-column>
      <el-table-column prop="phone" label="联系方式"></el-table-column>
      <el-table-column label="操作" width="280">
        <template v-slot="scope">
          <el-button type="primary" @click=save(scope.row) v-if="!scope.row.flag">选课</el-button>
          <el-button type="danger" @click=dele(scope.row) v-if="scope.row.flag">退选</el-button>
        </template>
      </el-table-column>
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
  name: 'Studentsc',
  data() {
    return {
      tableData: [],
      findData:[],
      sno:{},
      total: 0,
      dialogFormVisible:false ,
      admin: Cookies.get("admin") ? JSON.parse(Cookies.get('admin')) : {},
      params: {
        cname:null,
        pageNum: 1,
        pageSize: 8,
      },
      pid:null,
      form:{

      },
      rules: {
        name: [
          {required: true, message: '请输入分类名称', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    this.sno=this.admin.sno
    this.load();
  },
  methods: {
    search(){
      this.findData=[];
          if(this.params.cname==null) return
          this.tableData.forEach(data=>{
            if(data.cname===this.params.cname){
              this.findData.push(data);
            }
          })
      this.tableData=this.findData
    },
    dele(row){
      request.post("sc/delete?cno="+row.cno+"&sno="+this.admin.sno+"&tno="+row.tno).then(res=>{
        if(res.code==="200"){
          this.$notify.success("退选成功")
          //删除后自动刷新
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    load() {
        request.post("/sc/studentSclist", this.admin.sno).then(res=>{
          if (res.code === '200') {
            this.tableData = res.data
            this.total = res.data.total
          }
        })
      }
    ,
    reset() {
      this.params = {
        cname:null
      }
      this.load()
    },
    handleCurrentChange(pageNum) {
      //点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    save(row) {
        request.post("/sc/save",{
          cno:row.cno,
          sno:this.admin.sno,
          tno:row.tno
        }).then(res=>{
          if(res.code==="200"){
            this.$notify.success("选课成功")
            //删除后自动刷新
            this.load()
          } else {
            this.$notify.error(res.msg)
          }
        })
    }
  }
}
</script>


<style>
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}
.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
</style>