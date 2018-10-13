<template>
    <div class="home">
        <div class="center">
            <img alt="Vue logo" src="../assets/logo.png">
            <HelloWorld msg="Certifier Dapp!"/>
        </div>
        <bform></bform>
    </div>
</template>

<script>
  // @ is an alias to /src
  import HelloWorld from '@/components/HelloWorld.vue'
  import Bform from '@/components/forms/Bform.vue'
  export default {
    name: 'home',
    components: {
      HelloWorld,
      Bform
    }
  }
</script>
<style>
    .center {
        text-align: center;
    }
</style>