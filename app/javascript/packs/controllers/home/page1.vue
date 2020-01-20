<template>
  <div class="page1">
    page1area
    <p>{{ message }}</p>
    <button @click="callSampleComponent">change</button>
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
  methods: {
    callSampleComponent: function() {
      let component = this.$parent.$children.find(child => { return child.$options._componentTag === "sample" })
      component.message = "changed sample component!"
    }
  }
}
</script>
