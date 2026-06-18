import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import { viteStaticCopy } from 'vite-plugin-static-copy';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    viteStaticCopy({
      targets: [
        {
          src: 'assets/models/*.glb', // Caminho para os arquivos GLB
          dest: 'models' // Pasta para onde os arquivos GLB serão copiados no build
        },
      ],
      publicDir: 'public', 
    })
  ],
});
