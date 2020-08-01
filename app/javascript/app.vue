<template>
  <v-app id="app">
    <Header/>
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
.layout {
  background: #ECF6FE
}
</style>
