import { ref } from 'vue'
import { defineStore } from 'pinia'
import type { TodoItem } from '@/lib/todo';


export const useTodoStore = defineStore('todos', () => {
  const items = ref<TodoItem[]>([]);

  function addItem(text: string, priority: number = 1) {
    items.value.push({ text, priority });
  }

  return { items, addItem };
})
