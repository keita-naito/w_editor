<template>
  <v-app id="app">
    <dir class="header">
      <Header/>
    </dir>
    <div class="layout">
      <router-view></router-view>
    </div>
  </v-app>
</template>

<script>
import Header from "./components/layout/Header.vue"
export default {
  data: function () {
    return {
    }
  },

  components: {
    Header,
  }
}
</script>

<style scoped>
.header {
  margin-bottom: 70px;
}

.layout {
  background: #ECF6FE
}
</style>

<style>
.v-application code, .v-application kbd {
  border-radius: initial !important;
  font-size: initial !important;
  font-weight: initial !important;
}

.hljs {
  background-color: #23241f !important;
  padding: 0.5em !important;
}

.hljs, .hljs-tag, .hljs-subst {
    color: #fff !important;
}
</style>
