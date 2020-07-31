<template>
  <form>
    <v-text-field
      v-model="name"
      :counter="10"
      label="ユーザー名"
      value="name"
      required
    ></v-text-field>
    <v-text-field
      v-model="email"
      label="メールアドレス"
      value="email"
      required
    ></v-text-field>
    <v-text-field
      v-model="password"
      name="password"
      label="パスワード"
      hint="At least 8 characters"
      counter
    ></v-text-field>

    <v-btn color="#55c500" class="white--text font-weight-bold">登録</v-btn>
  </form>
</template>

<script>
export default {
  data() {
    return {
      name:  "",
      email: "",
      show: false,
      password: "",
    }
  },


  methods: {
  }
}
</script>

<style lang="scss" scoped>
</style>
