<template>
  <v-app id="app">
    <Header/>
    <v-container>
      <router-view></router-view>
    </v-container>
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
</style>
