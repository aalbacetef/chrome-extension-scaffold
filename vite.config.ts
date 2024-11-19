import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { join, resolve } from 'node:path'


const appConfig = {
  root: './src/app',
  build: {
    minify: true,
    manifest: true,
    outDir: resolve(join(__dirname, 'build', 'app')),
    rollupOptions: {
      input: {
        index: resolve(__dirname, 'src/app', 'index.html'),
      },
    },
  },
  plugins: [
    vue(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
}


const contentConfig = {
  root: './src/content',
  build: {
    minify: true,
    manifest: true,
    outDir: resolve(join(__dirname, 'build', 'content')),
    rollupOptions: {
      input: {
        index: resolve(__dirname, 'src/content', 'main.ts'),
      },
    },
  },
  plugins: [
    vue(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
}


const swConfig = {
  root: './src/background',
  build: {
    minify: true,
    manifest: true,
    outDir: resolve(join(__dirname, 'build', 'background')),
    rollupOptions: {
      input: {
        index: resolve(__dirname, 'src/background', 'main.ts'),
      },
    },
  },
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
}

export default defineConfig(({ mode }) => {
  if (mode === 'app') {
    return appConfig;
  }

  if (mode === 'content') {
    return contentConfig;
  }

  if (mode === 'service-worker') {
    return swConfig;
  }


  throw new Error(`no valid mode passed in: ${mode}`);
});
