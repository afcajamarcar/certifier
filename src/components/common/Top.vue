<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
            <img src="../../assets/minilogo.png" width="30" height="30" class="d-inline-block align-top" alt="">
            Certifier
        </a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <router-link class="nav-link" to="/">Home <span class="sr-only">(current)</span></router-link>
                </li>
                <li class="nav-item active">
                    <router-link class="nav-link" to="/about">About <span class="sr-only">(current)</span></router-link>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://github.com/afcajamarcar" target="_blank">My GitHub</a>
                </li>
            </ul>
        </div>
    </nav>
</template>

<script>
  export default {
    name: "Top"
  }
</script>

<style scoped>

</style>