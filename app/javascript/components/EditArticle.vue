<template>
  <form class="article-form">
    <v-text-field outlined single-line v-model="title" name="title" placeholder="タイトル" class="title-form"></v-text-field>
    <v-textarea
      outlined
      height="100%"
      v-model="body"
      name="body"
      placeholder="Markdown で記述することができます"
      class="body-form"
    ></v-textarea>
    <div class="create_btn_area">
      <v-btn @click="createArticle" color="#3085DE" class="create_btn font-weight-bold white--text">記事を投稿</v-btn>
    </div>
  </form>
</template>

<script>
import axios from "axios";
import Router from "../router/router";

const headers = {
  headers: {
    access_token: localStorage.getItem("access-token"),
    client: localStorage.getItem("client"),
    uid: localStorage.getItem("uid")
  }
};

export default {
  data() {
    return {
      title: "",
      body: "",
    }
  },

  methods: {
    async createArticle() {
      const params = {
        title: this.title,
        body: this.body
      };
      await axios
        .post("/api/v1/articles", params, headers)
        .then(_response => {
          Router.push("/");
        })
        .catch(e => {
          // TODO: 適切な Error 表示
          alert(e.response.data.errors);
        });
    }
  }
}
</script>

<style lang="scss" scoped>
.article-form {
  margin: 5px;
  height: calc(100% - 64px - 10px);
  display: flex;
  flex-flow: column;
  width: 100%;
}
.title-form {
  flex: none;
}
</style>

<style lang="scss">
.body-form > .v-input__control {
  height: 100%;
}

.create_btn_area {
  text-align: right;
}

.v-text-field .v-text-field__details {
  display: none;
}
</style>
