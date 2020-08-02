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
