
<template>
  <v-container v-model="article" class="item elevation-3 article-container">
    <v-layout xs-12 class="top-info-container">
      <span class="user-name">@{{ article.user.name }}</span>
      <time-ago :refresh="60" :datetime="article.updated_at" locale="en" tooltip="top" long></time-ago>
    </v-layout>
    <v-layout>
      <h1 class="article-title">{{ article.title }}</h1>
    </v-layout>
    <v-layout class="article-body-container">
      <div id="article-body" v-html="compiledMarkdown"></div>
    </v-layout>
  </v-container>
</template>
<script>
import axios from "axios";
import TimeAgo from 'vue2-timeago'
import marked from "marked";
import hljs from 'highlight.js';

export default {
  components: {
    TimeAgo,
  },

  data() {
    return {
      article: ""
    }
  },

  async created(){
    // Add 'hljs' class to code tag
    const renderer = new marked.Renderer();
    renderer.code = function(code, language) {
      return (
        "<pre" +
        '><code class="hljs">' +
        hljs.highlightAuto(code).value +
        "</code></pre>"
      );
    };
    marked.setOptions({
      renderer: renderer,
      tables: true,
      sanitize: true,
      langPrefix: "",
      highlight: function(code, lang) {
        if (!lang || lang == "default") {
          return hljs.highlightAuto(code, [lang]).value;
        } else {
          try {
            return hljs.highlight(lang, code, true).value;
          } catch (e) {
            // Do nonthing!
          }
        }
      }
    });
  },

  mounted() {
    this.fetchArticle(this.$route.params.id)
  },

  computed: {
    compiledMarkdown() {
      return marked(this.article.body);
    }
  },

  methods: {
    async fetchArticle(id) {
      await axios
        .get(`/api/v1/articles/${id}`)
        .then(response => {
          this.article = response.data;
        })
        .catch(e => {
          // TODO: 適切な Error 表示
          alert(e.response.statusText);
        });
    },
  }
}
</script>

<style lang="scss" scoped>
.top-info-container {
  margin-bottom: 1em;
}
.article-container {
  margin-top: 2em;
}
.article-title {
  font-size: 2.5em;
  line-height: 1.4;
}
.article-body-container {
  margin: 2em 0;
  font-size: 16px;
}
.user-name {
  margin-right: 1em;
}
</style>
