<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="根据学生姓名查询" v-model="params.sname"></el-input>
      <el-input style="width: 240px" placeholder="根据学生专业查询" v-model="params.sdept"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="search"><i class="el-icon-search">搜索</i></el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh">重置</i></el-button>
    </div>
    <!-- 表格 -->
    <el-table :data="tableData.slice((params.pageNum-1)*params.pageSize,params.pageNum*params.pageSize)" :default-sort = "{prop: 'sno', order: 'descending'}">
      <el-table-column type="expand" >
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="学号">
              <span>{{ props.row.sno }}</span>
            </el-form-item>
            <el-form-item label="姓名">
              <span>{{ props.row.sname }}</span>
            </el-form-item>
            <el-form-item label="性别">
              <span>{{ props.row.ssex }}</span>
            </el-form-item>
            <el-form-item label="专业">
              <span>{{ props.row.sdept }}</span>
            </el-form-item>
            <el-form-item label="年龄">
              <span>{{ props.row.sage }}</span>
            </el-form-item>
            <el-form-item label="入学时间">
              <span>{{ props.row.schoolTime }}</span>
            </el-form-item>
            <el-form-item label="联系方式">
              <span>{{ props.row.phone }}</span>
            </el-form-item>
            <el-form-item label="住址">
              <span>{{ props.row.address }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <el-table-column prop="sno" label="学号"  sortable ></el-table-column>
      <el-table-column prop="sname" label="姓名" sortable></el-table-column>
      <el-table-column prop="ssex" label="性别"></el-table-column>
      <el-table-column prop="sage" label="年龄"></el-table-column>
      <el-table-column prop="sdept" label="专业" sortable></el-table-column>
      <el-table-column label="操作" width="280">
        <template v-slot="scope">
          <el-button type="primary" @click="$router.push('/editStudent?id=' + scope.row.sno)">编辑</el-button>
          <el-popconfirm
              style="margin-left: 5px"
              title="您确定删除这行数据吗？"
              @confirm="del(scope.row.sno)"
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
  name: 'CategoryList',
  data() {
    return {
      tableData: [

      ],
      total: 0,
      dialogFormVisible:false ,
      admin: Cookies.get("admin") ? JSON.parse(Cookies.get('admin')) : {},
      params: {
        sname:null,
        sdept:null,
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
      request.post("/student/listbycondition",this.params).then(res=>{
        if (res.code === '200') {
          this.tableData = res.data
          this.total = res.data.length
        }
      })
    },
    load() {
      request.get('/student/list', {
        params: this.params
      }).then(res => {
        if (res.code === '200') {
          this.tableData = res.data
          this.total = res.data.length
        }
      })
    },
    reset() {
      this.params = {
        sname:null,
        sdept:null
      }
      this.load()
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
    expandColumn(row, expandedRows) {
      // 每次只展开一行
      let that = this;
      if (expandedRows.length) {
        that.expands = []
        if (row) {
          that.expands.push(row.id)
        }
      } else {
        that.expands = []
      }
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