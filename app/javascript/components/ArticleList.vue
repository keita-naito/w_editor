<template>
  <div id="articles-container">
    <ul>
      <li v-for="article in articles" v-bind:key="article.id">
        <div>{{article.title}}</div>
        <div>{{article.body}}</div>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      articles: []
    }
  },

  mounted() {
    this.fetchArticles();
  },

  methods: {
    async fetchArticles() {
      await axios.get("/api/v1/articles").then(response => {
        response.data.map((article) => {
          this.articles.push(article);
        });
      });
    }
  }
}
</script>
