<script setup lang="ts">

</script>

<template>
  <main>
    <article>
      <header>Your To Dos</header>
    </article>
    <article>
      <ul>
        <li v-for="(item, index) in store.items.value" class="todo-item--wrapper" :key="index">
          <todo-item :text="item.text" :priority="item.priority"></todo-item>
        </li>
      </ul>
    </article>
  </main>
</template>

<style scoped></style>
