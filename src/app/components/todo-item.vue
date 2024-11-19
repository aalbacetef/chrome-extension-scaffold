<script setup lang="ts">
import { defineProps } from 'vue';

defineOptions({ name: 'todo-item' });

const props = defineProps<{
  text: string;
  priority: number;
}>();

</script>

<template>
  <div class="todo-item">
    <p>priority: {{ props.priority }}</p>
    <p>{{ props.text }}</p>
  </div>
</template>
