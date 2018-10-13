<template>
    <div id="app">
        <top></top>
        <router-view/>
    </div>
</template>

<script>
  import Top from '@/components/common/Top.vue'
  export default {
    components: {
      Top
    }
  }
</script>
