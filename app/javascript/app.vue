<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
  // Imports
  import showPosts from './packs/components/showPosts.vue';
  import login from './packs/components/login.vue';
  export default {
    components: {
    },
    data () {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style>
  body{
    margin: 0;
    font-family: 'Nunito SemiBold';
  }
</style>
