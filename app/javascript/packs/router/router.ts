import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import UserList from '../components/UserList.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: UserList },
  ],
})
