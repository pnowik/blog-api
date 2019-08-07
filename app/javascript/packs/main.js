import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import VueResource from 'vue-resource'
import Routes from './routes'
import VueRouter from 'vue-router'


// Use packages
Vue.use(VueResource);
Vue.use(VueRouter);

Vue.config.productionTip = false;

// Register routes
const router = new VueRouter({
    routes: Routes
});

new Vue({
    el: '#app',
    render: h => h(App),
    router: router
});