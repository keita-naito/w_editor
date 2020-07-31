import Vue from "vue";
import Router from "vue-router";
import ArticleList from "../components/ArticleList.vue";
import Registration from "../components/Registration.vue";

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
  ],
});
export default router;
