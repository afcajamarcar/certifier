import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Web3 from 'web3'

Vue.config.productionTip = false

//Window refers to the browser
window.addEventListener('load', () => {
  if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider); //currentProvider => tool for accessing blockchain from the browser
  } else {
    console.warn('Unable to detect Metamask')
  }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
