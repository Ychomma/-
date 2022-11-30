<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="根据学号查询" v-model="params.sno"></el-input>
      <el-input style="width: 240px" placeholder="根据课程名查询" v-model="params.cname"></el-input>
      <el-input style="width: 240px" placeholder="根据教师名查询" v-model="params.tname"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="search"><i class="el-icon-search">搜索</i></el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh">重置</i></el-button>
      <el-button style="margin-left: 5px" type="primary" @click="isShow=true">成绩概况</el-button>
    </div>
    <!-- 表格 -->
    <el-table :data="tableData" stripe  row-key="id" default-expand-all>
      <el-table-column prop="sno" label="学号"></el-table-column>
      <el-table-column prop="sname" label="姓名"></el-table-column>
      <el-table-column prop="sdept" label="专业"></el-table-column>
      <el-table-column prop="cno" label="课程编号"></el-table-column>
      <el-table-column prop="cname" label="课程名称"></el-table-column>
      <el-table-column prop="tno" label="授课教师编号"></el-table-column>
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

    <el-dialog title="成绩概况" :visible.sync="isShow" @open="open()">
      <span>平均分：{{this.avg.toFixed(2)}}</span>
      <span style="margin-left: 20px">最高分：{{this.max}}</span>
      <span style="margin-left: 20px">最低分：{{this.min}}</span>
      <div id="echart" style="width: 100%; height: 300px"></div>
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
      avg:0,
      max:0,
      min:100,
      total: 0,
      dialogFormVisible:false ,
      admin: Cookies.get("admin") ? JSON.parse(Cookies.get('admin')) : {},
      params: {
        sno:null,
        cno:null,
      },
      form:{
        cno:{},
        sno:{},
        grade:{}
      },
      option : {
        xAxis: {
            type: 'category',
            data: ['0-19','20-39', '40-59', '60-79', '80-100']

        },
        yAxis: {
           type:'value'
        },
        tooltip: {},
        series: [
          {
            name:'成绩',
            data: new Array(5).fill(3),
            type: 'bar',
            showBackground: true,
            backgroundStyle: {
              color: 'rgba(180, 180, 180, 0.2)'
            }
          }
        ]
      },
      isShow: false,
      }
    },
  created() {
    this.load();
  },
  methods: {
    save() {
      request.post("/sc/update", this.form).then(res => {
        if (res.code === '200') {
          this.dialogFormVisible = false;
          this.$notify.success("更新成绩成功")
          //删除后自动刷新
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    update(row) {
      this.dialogFormVisible = true;
      this.form.cno = row.cno;
      this.form.sno = row.sno;
      this.form.grade = row.grade;
    },
    load() {
      request.get('/sc/list', {
        params: this.params
      }).then(res => {
        if (res.code === '200') {
          this.tableData = res.data.data
          this.total = res.data.total
        }
      })
    },
    reset() {
      this.params = {
        sno: null,
        cno: null,
      }
      this.load()
    },
    search() {
      console.log(this.params)
      request.post("/sc/listbycondition", this.params).then(res => {
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
    drawChart() {
      console.log(this.option.series[0].data)
      const myChart = this.$echarts.init(document.getElementById("echart"));
      myChart.setOption(this.option);
    },
    open() {
      this.$nextTick(() => {
        //  执行echarts方法
        this.avg=0
        this.max=0
        this.min=100
        let arr=new Array(5).fill(0);
        this.tableData.forEach(res=>{
          if(res.grade>this.max) this.max=res.grade
          if(res.grade<this.min) this.min=res.grade
          this.avg=this.avg+res.grade
          if(res.grade===100)
          {
            arr[4]=arr[4]+1
          }
          else{
            arr[parseInt(res.grade/20)]=arr[parseInt(res.grade/20)]+1
          }
        })
        this.option.series[0].data=arr;
        this.avg=this.avg/(this.tableData.length)
        this.drawChart();
      });
    }
  }
}
</script>

<style scoped>

</style>