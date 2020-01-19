<template>
  <div class="page1">
    page1area
    <p>{{ message }}</p>
    {{$route.param}}
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
      message: "Hello Vue Page1!"
    }
  },
  components: function () {
    "sample"
  }
}
</script>
