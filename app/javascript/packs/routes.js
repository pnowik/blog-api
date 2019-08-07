import login from './components/login.vue';
import registration from './components/registration.vue';
import showPosts from './components/showPosts.vue';

export default [
    { path: '/', component: showPosts},
    { path: '/auth/login', component: login},
    { path: '/signup', component: registration}
]
