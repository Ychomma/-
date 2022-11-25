import Vue from 'vue'
import VueRouter from 'vue-router'
import Layout from '../views/Layout.vue'
import Cookies from "js-cookie";

Vue.use(VueRouter)

const routes = [
    // 登录
    {
        path: '/login',
        name: 'Login',
        component: () => import('@/views/login/Login')
    },
    // 主页
    {
        path: '/',
        name: 'Layout',
        component: Layout,
        redirect: '/home', //重定向，这样才能显示Home子路由，否则停留在Layout
        //'/'的子路由：完整路由是由Layout的path和子路由的path拼接起来的
        children: [
            {
                path: 'home',
                name: 'Home',
                component: () => import('@/views/home/HomeView.vue')
            },
            // Admin
            {
                path: 'adminList',
                name: 'AdminList',
                component: () => import('@/views/admin/List.vue')
            },
            {
                path: 'addAdmin',
                name: 'AddAdmin',
                component: () => import('@/views/admin/Add.vue')
            },
            {
                path: 'editAdmin',
                name: 'EditAdmin',
                component: () => import('@/views/admin/Edit.vue')
            },
            {
                path: 'studentList',
                name: 'StudentList',
                component: () => import('@/views/student/List.vue')
            },
            {
                path: 'editStudent',
                name: 'EditStudent',
                component: () => import('@/views/student/Edit.vue')
            },
            {
                path: 'addStudent',
                name: 'AddStudent',
                component: () => import('@/views/student/Add.vue')
            }

        ]
    },
    {
        path: "*",
        component: () => import('@/views/404')
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

router.beforeEach((to, from, next) => {
    if (to.path === '/login') next()
    const admin = Cookies.get("admin")
    if (!admin && to.path !== '/login') return next("/login") //强制退回到登录页面
    next()
})
export default router
