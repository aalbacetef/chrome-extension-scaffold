<script setup lang="ts">
import { RouterLink, RouterView, useRouter } from 'vue-router'

const r = useRouter();
r.push('/');

</script>

<template>
  <div class="wrapper">

    <header class="nav-menu">
      <nav>
        <RouterLink to="/">Main</RouterLink>
      </nav>
    </header>


    <div class="app--wrapper">
      <RouterView />
    </div>
  </div>
</template>


<style scoped>
.wrapper {
  height: 100%;
}

.nav-menu,
.app--wrapper {
  height: 100%;
  padding: var(--theme-padding-base);
}

.nav-menu {
  border: 1px solid #cccccc;
}

.nav-menu nav {
  display: flex;
  flex-direction: column;
}

nav>a {
  margin-bottom: 5px;
}
</style>
