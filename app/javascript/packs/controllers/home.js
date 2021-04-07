/* eslint no-console: 0 */

import Sample from '../components/sample.vue'
import Page1 from './home/page1.vue'
import Index from '../components/index.vue'

var router = new VueRouter({
  routes: [
    { path: "/page1", component: Page1},
    { path: "/page2", component: {template: "<div>page2area</div>"}}
  ]
});

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#home-app',
    router: router,
    data: {
      message2: "Can you say hello?",
      selectedValue: ""
    },
    mounted: () => {
      console.log("home app mounted");
    },
    components: {
      "sample": Sample,
      "index": Index
    }
  })
})
