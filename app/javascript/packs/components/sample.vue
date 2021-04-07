<template>
  <div class="sample">
    <p>{{ message }}</p>
    <p>さんぷる</p>
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
      message: "sample component"
    }
  }
}
</script>
