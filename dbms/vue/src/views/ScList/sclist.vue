<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="根据课程号查询" v-model="params.cno"></el-input>
      <el-input style="width: 240px" placeholder="根据学号查询" v-model="params.sno"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="search"><i class="el-icon-search">搜索</i></el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh">重置</i></el-button>
    </div>
    <!-- 表格 -->
    <el-table :data="tableData" stripe  row-key="id" default-expand-all>
      <el-table-column prop="sno" label="学号" width="80"></el-table-column>
      <el-table-column prop="sname" label="姓名"></el-table-column>
      <el-table-column prop="sdept" label="专业"></el-table-column>
      <el-table-column prop="cno" label="课程编号"></el-table-column>
      <el-table-column prop="cname" label="课程名称"></el-table-column>
      <el-table-column prop="tname" label="授课老师"></el-table-column>
      <el-table-column prop="grade" label="成绩"></el-table-column>
      <el-table-column label="操作" width="280">
        <template v-slot="scope">
          <el-button type="primary" @click="update(scope.row)">编辑</el-button>
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

    <el-dialog title="更改选课成绩" :visible.sync="dialogFormVisible" width="30%">
      <el-form :model="form" label-width="100px" style="width: 85%">
        <el-form-item label="成绩" >
          <el-input v-model="form.grade"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>


<script>
import request from "@/utils/request";
import Cookies from "js-cookie";

export default {
  name: 'ScList',
  data() {
    return {
      tableData: [],
      total: 0,
      dialogFormVisible:false ,
      admin: Cookies.get("admin") ? JSON.parse(Cookies.get('admin')) : {},
      params: {
        sno:null,
        cno:null,
      },
      pid:null,
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
    save(){
        request.post("/sc/update",this.form).then(res=>{
          if (res.code === '200') {
            this.dialogFormVisible=false;
            this.$notify.success("更新成绩成功")
            //删除后自动刷新
            this.load()
          } else {
            this.$notify.error(res.msg)
          }
        })
    },
    update(row){
      this.dialogFormVisible=true;
      this.form.cno=row.cno;
      this.form.sno=row.sno;
      this.form.grade=row.grade;


    },
    load() {
      request.get('/sc/list', {
        params: this.params
      }).then(res => {
        console.log(res)
        if (res.code === '200') {
          this.tableData = res.data.data
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
      console.log(this.params)
      request.post("/sc/listbycondition",this.params).then(res=>{
        if (res.code === '200') {
          this.tableData = res.data.data
          this.total = res.data.total
        }
      })
    },
    handleCurrentChange(pageNum) {
      //点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/student/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success("删除成功")
          //删除后自动刷新
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
  }
}
</script>

<style scoped>

</style>