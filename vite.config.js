import { defineConfig } from 'vite'
import { readdirSync } from 'fs'
import { resolve } from 'path'

const files = readdirSync('.').filter(f => f.endsWith('.html'))
const input = {}
files.forEach(f => {
  input[f.replace('.html', '')] = resolve(__dirname, f)
})

export default defineConfig({
  root: '.',
  server: {
    port: 5173,
    host: '0.0.0.0',
    open: false,
  },
  build: {
    outDir: 'dist',
    target: 'esnext',
    rollupOptions: {
      input: input,
    },
  },
})
