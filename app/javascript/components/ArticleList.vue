<template>
  <v-container class="mt-5">
    <v-card  tile flat class="mx-auto py-7 px-5" max-width="800">
      <div v-for="article in articles" v-bind:key="article.id">
        <v-list-item two-line>
          <!-- 将来的に画像を配置したいので配置 -->
          <template v-if="article.user.image">
            <v-list-item-avatar>
              <v-img :src="article.user.image"></v-img>
            </v-list-item-avatar>
          </template>
          <template v-else>
            <v-list-item-avatar size="50px" color="#3085DE">
              <v-icon large color="#fff">fas fa-user</v-icon>
            </v-list-item-avatar>
          </template>

          <v-list-item-content>
            <v-list-item-title class="article-title">
              <router-link :to="{ name: 'article', params: { id: article.id }}">{{ article.title }}</router-link>
            </v-list-item-title>
            <v-list-item-subtitle>
              by {{article.user.name}}
              <time-ago
                :refresh="60"
                :datetime="article.updated_at"
                locale="en"
                tooltip="right"
                long
              ></time-ago>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
        <v-divider></v-divider>
      </div>
    </v-card>
  </v-container>
</template>

<script>
import axios from "axios";
import TimeAgo from 'vue2-timeago'

export default {
  components: {
    TimeAgo,
  },

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

<style lang="scss" scoped>
.article-title {
  a {
    color: #000;
    font-weight: bold;
    text-decoration: none;
  }
  a:hover {
    text-decoration: underline;
  }
  a:visited {
    color: #777;
  }
}
</style>
