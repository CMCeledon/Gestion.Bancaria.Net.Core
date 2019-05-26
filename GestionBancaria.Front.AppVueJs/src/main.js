import Vue from 'vue'
import './plugins/vuetify'
import VueAxios from 'vue-axios'
import axios from 'axios'
import './plugins/vuetify'
import App from './App.vue'
import router from './router'
import Notification from 'vue-notification';
import '@fortawesome/fontawesome-free/css/all.css'
import VueMaterial from 'vue-material'
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default-dark.css' // This line here

Vue.use(VueMaterial)
Vue.config.productionTip = false

Vue.use(VueAxios, axios)
Vue.use(Notification);
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')


