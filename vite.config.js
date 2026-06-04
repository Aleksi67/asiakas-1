import { resolve } from 'path';
import { defineConfig } from 'vite';
import { readdirSync } from 'fs';

const htmlFiles = readdirSync('.').filter(f => f.endsWith('.html'));
const input = Object.fromEntries(htmlFiles.map(f => [f.replace('.html',''), resolve(__dirname, f)]));

export default defineConfig({
  build: {
    target: 'es2022',
    rollupOptions: { input }
  }
});
