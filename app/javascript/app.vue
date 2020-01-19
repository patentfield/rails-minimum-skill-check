<template>
  <div id="app">
    <p>{{ message1 }}</p>
  </div>
</template>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

<script>
export default {
  data: function () {
    return {
      message1: "Hello Vue!"
    }
  }
}
</script>
