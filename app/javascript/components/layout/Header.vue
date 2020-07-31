<template>
  <v-app-bar app dark color="#3085DE">
    <router-link to="/" class="header-link">
      <v-toolbar-title class="white--text">WonderfulEditor</v-toolbar-title>
    </router-link>

    <v-spacer></v-spacer>

    <router-link to="/" class="header-link">
      <v-btn text class="register">ユーザー登録</v-btn>
    </router-link>
    <router-link to="/" class="header-link">
      <v-btn text class="login">ログイン</v-btn>
    </router-link>
  </v-app-bar>
</template>

<style lang="scss" scoped>
.header-link {
  text-decoration: none;
}
.register {
  border: 2px solid #fff;
  border-radius: 5px;
  font-weight: bold;
}
.login {
  font-weight: bold;
}
</style>
