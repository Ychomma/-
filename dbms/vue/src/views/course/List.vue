<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="根据课程名称查询" v-model="params.cname"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="search"><i class="el-icon-search">搜索</i></el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh">重置</i></el-button>
    </div>
    <!-- 表格 -->
    <el-table :data="tableData.slice((params.pageNum-1)*params.pageSize,params.pageNum*params.pageSize)" stripe>
      <el-table-column type="expand" >
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="课程编号">
              <span>{{ props.row.cno }}</span>
            </el-form-item>
            <el-form-item label="课程名">
              <span>{{ props.row.cname }}</span>
            </el-form-item>
            <el-form-item label="上课地点">
              <span>{{ props.row.place }}</span>
            </el-form-item>
            <el-form-item label="开课时间">
              <span>{{ props.row.startTime }}</span>
            </el-form-item>
            <el-form-item label="结课时间">
              <span>{{ props.row.endTime }}</span>
            </el-form-item>
            <el-form-item label="课程简介">
              <span>{{ props.row.introduction }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <el-table-column prop="cno" label="课程编号" ></el-table-column>
      <el-table-column prop="cname" label="课程名称"></el-table-column>
      <el-table-column prop="place" label="上课地点"></el-table-column>
      <el-table-column prop="startTime" label="开课时间"></el-table-column>
      <el-table-column prop="endTime" label="结课时间"></el-table-column>
      <el-table-column prop="flag" label="是否停止选课">
        <template v-slot="scope">
          <span v-if="scope.row.flag">已结束选课</span>
          <span v-if="!scope.row.flag" style="color:red">未结束选课</span>
        </template>
      </el-table-column>
      <el-table-column prop="tno" label="教师编号"></el-table-column>
      <el-table-column prop="tname" label="教师姓名"></el-table-column>
      <el-table-column label="操作" width="280">
        <template v-slot="scope">
          <el-button type="primary" @click="$router.push('/editCourse?id=' + scope.row.cno)">编辑</el-button>
          <el-popconfirm
              style="margin-left: 5px"
              title="您确定停止选课吗？"
              @confirm="endSelect(scope.row)"
          >
            <el-button type="warning" slot="reference" v-if="!scope.row.flag">停止选课</el-button>
          </el-popconfirm>
          <el-popconfirm
              style="margin-left: 5px"
              title="您确定恢复选课吗？"
              @confirm="endSelect(scope.row)"
          >
            <el-button type="primary" slot="reference" v-if="scope.row.flag">恢复选课</el-button>
          </el-popconfirm>
          <el-popconfirm
              style="margin-left: 5px"
              title="您确定删除这行数据吗？"
              @confirm="del(scope.row.cno)"
          >
            <el-button type="danger" slot="reference">删除</el-button>
          </el-popconfirm>
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
  name: 'CourseList',
  data() {
    return {
      tableData: [],
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
    this.load();
  },
  methods: {
    search(){
      request.post("/course/listbycondition",this.params).then(res=>{
          this.tableData = res.data
          this.total = res.data.length

      })
    },
    load() {
      request.get('/course/list', {
        params: this.params
      }).then(res => {
        console.log(res)
        if (res.code === '200') {
          this.tableData = res.data
          this.total = res.data.length
        }
      })

    },
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
    del(id) {
      request.delete("/course/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success("删除成功")
          //删除后自动刷新
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    endSelect(row){
      request.post("/course/endselect",{cno:row.cno}).then(res=>{
        if(res.code==='200'){
          this.$notify.success("操作成功")
          this.load();
        }
        else this.$notify.error(res.msg)
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