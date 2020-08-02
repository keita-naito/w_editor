import Vue from "vue";
import Router from "vue-router";
import ArticleList from "../components/ArticleList.vue";
import Registration from "../components/Registration.vue";
import Login from "../components/Login.vue";

Vue.use(Router);


const router = new Router({
  mode: "history",
  routes: [
    //ルーティングの設定
    {
      path: "/",
      component: ArticleList,
    },
    {
      path: "/sign_up",
      component: Registration,
    },
    {
      path: "/sign_in",
      component: Login,
    },
  ],
});
export default router;
