/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router';
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
import locale from 'element-ui/lib/locale/lang/ja'

window.Vue = Vue;
window.VueRouter = VueRouter;

window.Vue.use(Element, {locale})
window.Vue.use(VueRouter)

console.log('Hello World from Webpacker')

document.addEventListener('DOMContentLoaded', () => {
  const navApp = new Vue({
    el: '#nav-app',
    data: {
    },
    mounted: () => {
      console.log("nav app mounted");
    }
  })

  const footerApp = new Vue({
    el: '#footer-app',
    data: {
    },
    mounted: () => {
      console.log("footer app mounted");
    }
  })
})
