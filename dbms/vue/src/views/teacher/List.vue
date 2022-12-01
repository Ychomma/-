<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="根据教师编号查询" v-model="params.tno"></el-input>
      <el-input style="width: 240px" placeholder="根据教师姓名查询" v-model="params.tname"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="search"><i class="el-icon-search">搜索</i></el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh">重置</i></el-button>
    </div>
    <!-- 表格 -->
    <el-table :data="tableData.slice((params.pageNum-1)*params.pageSize,params.pageNum*params.pageSize)" stripe  row-key="id" :default-sort = "{prop: 'sno', order: 'descending'}"l>
      <el-table-column prop="tno" label="教师编号" sortable></el-table-column>
      <el-table-column prop="tname" label="教师姓名" sortable></el-table-column>
      <el-table-column prop="phone" label="教师联系方式"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column prop="introduction" label="教师主页" show-overflow-tooltip>
        <template slot-scope="scope">
          <el-link :href=scope.row.introduction target="_blank">{{scope.row.introduction}}></el-link>
        </template>

      </el-table-column>
      <el-table-column label="操作" width="280">
        <template v-slot="scope">
          <el-button type="primary" @click="$router.push('/editTeacher?id=' + scope.row.tno)">编辑</el-button>
          <el-popconfirm
              style="margin-left: 5px"
              title="您确定删除这行数据吗？"
              @confirm="del(scope.row.tno)"
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
        tname:null,
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
      request.post("/teacher/listbycondition",this.params).then(res=>{
        console.log(res)
        if (res.code === '200') {
          this.tableData = res.data
          this.total = res.data.length
        }
      })
    },
    load() {
      request.get('/teacher/list', {
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
        tname:null,
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
      request.delete("/teacher/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success("删除成功")
          //删除后自动刷新
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    handleAdd(row){
      this.pid=row.id
      this.dialogFormVisible=true;
    },
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          this.form.pid=this.pid
          request.post('/course/save', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success('新增二级分类成功')
              this.$refs['ruleForm'].resetFields()
              this.dialogFormVisible=false
              this.load()
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    }
  }
}
</script>

<style scoped>

</style>